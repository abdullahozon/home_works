import 'package:flutter/material.dart';
import 'package:quiz_app/styles/app_text_styles.dart';
import 'package:quiz_app/styles/app_colors.dart';

class NextQuizButton extends StatelessWidget {
  final VoidCallback onNextPressed;
  final bool enabled;
  final bool isLast;

  const NextQuizButton({
    super.key,
    required this.onNextPressed,
    this.enabled = true,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? onNextPressed : null,
      style: TextButton.styleFrom(
        backgroundColor: enabled ? AppColors.secondaryColor : Colors.grey[700],
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isLast ? 'Finish' : 'Next',
            style: AppTextStyles.regular16(
              color: enabled ? Colors.white : Colors.grey[400],
            ),
          ),
          SizedBox(width: 4),
          Icon(
            isLast ? Icons.done : Icons.navigate_next,
            color: enabled ? Colors.white : Colors.grey[400],
            size: 18,
          ),
        ],
      ),
    );
  }
}
