import 'package:flutter/material.dart';
import 'package:quiz_app/styles/app_text_styles.dart';
import 'package:quiz_app/styles/app_colors.dart';

class StartQuizButton extends StatelessWidget {
  const StartQuizButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          //لجعل الزر ياخذ عرض الشاشة, حل افضل من انفينيتي
          width: MediaQuery.sizeOf(context).width,
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Start Quiz',
                style: AppTextStyles.medium18(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
