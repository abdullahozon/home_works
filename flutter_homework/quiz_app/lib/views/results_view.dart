import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_managaer.dart';
import 'package:quiz_app/styles/app_colors.dart';
import 'package:quiz_app/styles/app_text_styles.dart';

class ResultsView extends StatelessWidget {
  final QuestionManager questionManager;

  const ResultsView({super.key, required this.questionManager});

  @override
  Widget build(BuildContext context) {
    final total = questionManager.questions.length;
    final correct = questionManager.correctCount;
    final percentage = (correct / total) * 100;
    final passed = percentage >= 50;

    return Scaffold(
      appBar: AppBar(
        title: Text('The Result'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...questionManager.questions.map((q) {
            final isCorrect = q.selectedAnswer == q.correctAnswer;
            return Card(
              color: isCorrect ? Colors.green[50] : Colors.red[50],
              child: ListTile(
                title: Text(
                  q.question,
                  style: AppTextStyles.medium18(color: AppColors.primaryColor),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Answer is: ${q.selectedAnswer}'),
                    if (!isCorrect)
                      Text('The Correct Answer: ${q.correctAnswer}'),
                  ],
                ),
                trailing: Icon(
                  isCorrect ? Icons.check_circle : Icons.cancel,
                  color: isCorrect ? Colors.green : Colors.red,
                ),
              ),
            );
          }),
          SizedBox(height: 24),
          Text(
            'Degree:  $correct / $total',
            style: AppTextStyles.medium24(color: AppColors.primaryColor),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            passed ? 'Successful 🎉' : 'Failed 😞',
            style: AppTextStyles.medium24(
              color: passed ? Colors.greenAccent : Colors.redAccent,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          TextButton(
            onPressed: () {
              questionManager.reset();
              Navigator.pushReplacementNamed(context, '/');
            },
            style: TextButton.styleFrom(
              backgroundColor: AppColors.secondaryColor,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Retest',
              style: AppTextStyles.medium18(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
