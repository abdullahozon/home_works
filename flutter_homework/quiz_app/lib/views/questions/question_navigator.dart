import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_managaer.dart';
import 'package:quiz_app/widgets/question_action_buttons.dart';
import 'package:quiz_app/views/results_view.dart';

class QuestionNavigator extends StatelessWidget {
  final PageController pageController;
  final ValueNotifier<int> pageIndex;
  final QuestionManager questionManager;

  const QuestionNavigator({
    super.key,
    required this.pageController,
    required this.pageIndex,
    required this.questionManager,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: pageIndex,
      builder: (_, idx, __) {
        final canGoBack = questionManager.canGoBack(idx);
        final hasAnswered = questionManager.canGoNext(idx);
        final isLast = questionManager.isLast(idx);

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
                builder:
                    (_) => AlertDialog(
                      title: const Text('تأكيد'),
                      content: const Text('هل أنت متأكد من إنهاء الاختبار؟'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('إلغاء'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => ResultsView(
                                      questionManager: questionManager,
                                    ),
                              ),
                            );
                          },
                          child: const Text('نعم'),
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
      },
    );
  }
}
