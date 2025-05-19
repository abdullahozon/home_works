import 'package:flutter/material.dart';
import 'package:quiz_app/styles/app_text_styles.dart';
import 'package:quiz_app/styles/app_colors.dart';

class BackQuizButton extends StatelessWidget {
  final VoidCallback onBackPressed;
  final bool enabled;

  const BackQuizButton({
    super.key,
    required this.onBackPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? onBackPressed : null,
      style: TextButton.styleFrom(
        backgroundColor: enabled ? AppColors.questionColor : Colors.grey[700],
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: enabled ? Colors.white : Colors.grey[400],
            size: 14,
          ),
          SizedBox(width: 4),
          Text(
            'Back',
            style: AppTextStyles.regular16(
              color: enabled ? Colors.white : Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
