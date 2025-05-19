import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_managaer.dart';
import 'package:quiz_app/widgets/question_item.dart';

class QuestionBody extends StatelessWidget {
  final PageController pageController;
  final QuestionManager questionManager;
  final VoidCallback onAnswerSelected;

  const QuestionBody({
    super.key,
    required this.pageController,
    required this.questionManager,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questionManager.total,
      itemBuilder: (context, index) {
        return QuestionItem(
          questionManager: questionManager,
          index: index,
          questionModel: questionManager.questions[index],
          onAnswerSelected: onAnswerSelected,
        );
      },
    );
  }
}
