import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/back_button.dart';
import 'package:quiz_app/widgets/next_button.dart';

class QuestionActionButtons extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onNextPressed;
  final bool canGoBack;
  final bool canGoNext;
  final bool isLast;

  const QuestionActionButtons({
    super.key,
    required this.onBackPressed,
    required this.onNextPressed,
    this.canGoBack = true,
    this.canGoNext = true,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BackQuizButton(
          onBackPressed: onBackPressed,
          enabled: canGoBack,
        ),
        Spacer(),
        NextQuizButton(
          onNextPressed: onNextPressed,
          enabled: canGoNext,
          isLast: isLast,
        ),
      ],
    );
  }
}
