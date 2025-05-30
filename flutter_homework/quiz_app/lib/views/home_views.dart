import 'package:flutter/material.dart';
import 'package:quiz_app/styles/app_colors.dart';
import 'package:quiz_app/styles/app_text_styles.dart';
import 'package:quiz_app/widgets/custom_background_container.dart';
import 'package:quiz_app/widgets/start_quiz_button.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            CustomBackgroundContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Text('Good Morning,', style: AppTextStyles.regular16()),
                    SizedBox(height: 8),
                    Text(
                      'New tobic is waiting',
                      style: AppTextStyles.medium24(),
                    ),

                    Spacer(),
                    StartQuizButton(
                      text: 'Start Quiz', // New
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/questions');
                      },
                    ),

                    SizedBox(height: 14),
                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
