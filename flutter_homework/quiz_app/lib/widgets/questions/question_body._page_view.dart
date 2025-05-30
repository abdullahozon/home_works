import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_managaer.dart';
import 'package:quiz_app/widgets/question_item.dart';

class QuestionBodyPageView extends StatelessWidget {
  final PageController pageController;
  final QuestionManager questionManager;
  final VoidCallback onAnswerSelected;
  final ValueChanged<int> onPageChanged;

  const QuestionBodyPageView({
    Key? key,
    required this.pageController,
    required this.questionManager,
    required this.onAnswerSelected,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questionManager.total,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return QuestionItem(
          key: ValueKey(index),
          index: index,
          questionModel: questionManager.questions[index],
          questionManager: questionManager,
          onAnswerSelected: onAnswerSelected,
        );
      },
    );
  }
}