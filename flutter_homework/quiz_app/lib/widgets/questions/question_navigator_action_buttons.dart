import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_managaer.dart';
import 'package:quiz_app/widgets/question_action_buttons.dart';
import 'package:quiz_app/views/results_view.dart';

class QuestionNavigatorActionButtons extends StatelessWidget {
  final PageController pageController;
  final int currentPage;
  final QuestionManager questionManager;

  const QuestionNavigatorActionButtons({
    Key? key,
    required this.pageController,
    required this.currentPage,
    required this.questionManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final canGoBack = currentPage > 0;
    final hasAnswered = questionManager.canGoNext(currentPage);
    final isLast = questionManager.isLast(currentPage);

    return QuestionActionButtons(
      onBackPressed: () {
        if (canGoBack) {
          pageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      },
      onNextPressed: () {
        if (isLast) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Confirm'),
              content: const Text('Are you sure you want to finish the quiz?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ResultsView(questionManager: questionManager),
                      ),
                    );
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
          );
        } else if (hasAnswered) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        }
      },
      canGoBack: canGoBack,
      canGoNext: hasAnswered,
      isLast: isLast,
    );
  }
}