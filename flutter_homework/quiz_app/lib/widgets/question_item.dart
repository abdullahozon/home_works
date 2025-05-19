import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_managaer.dart';
import 'package:quiz_app/models/questoin_model.dart';
import 'package:quiz_app/styles/app_text_styles.dart';

import 'package:quiz_app/widgets/question_header.dart';
import 'package:quiz_app/widgets/question_options.dart';

class QuestionItem extends StatelessWidget {
  final QuestionManager questionManager;
  final int index;
  final QuestionModel questionModel;
  final VoidCallback onAnswerSelected; // ← جديد

  const QuestionItem({
    super.key,
    required this.questionManager,
    required this.index,
    required this.questionModel,
    required this.onAnswerSelected, // ← جديد
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionHeader(index: index, questionModel: questionModel),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 20),
          child: Text(
            questionModel.question,
            style: AppTextStyles.medium24(color: Colors.white),
          ),
        ),
        const SizedBox(height: 32),
        QuestionOptions(
          questionIndex: index,
          options: questionModel.options,
          questionManager: questionManager,
          onAnswerSelected: onAnswerSelected, // ← هنا أيضاً
        ),
      ],
    );
  }
}
