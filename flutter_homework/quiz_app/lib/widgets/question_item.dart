import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_managaer.dart';
import 'package:quiz_app/models/questoin_model.dart';
import 'package:quiz_app/styles/app_text_styles.dart';
import 'package:quiz_app/widgets/question_header.dart';
import 'package:quiz_app/widgets/question_options.dart';

class QuestionItem extends StatefulWidget {
  final int index;
  final QuestionModel questionModel;
  final QuestionManager questionManager;
  final VoidCallback onAnswerSelected;

  const QuestionItem({
    Key? key,
    required this.index,
    required this.questionModel,
    required this.questionManager,
    required this.onAnswerSelected,
  }) : super(key: key);

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionHeader(
          index: widget.index,
          questionModel: widget.questionModel,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 20),
          child: Text(
            widget.questionModel.question,
            style: AppTextStyles.medium24(),
          ),
        ),
        const SizedBox(height: 32),
        QuestionOptions(
          questionIndex: widget.index,
          options: widget.questionModel.options,
          questionManager: widget.questionManager,
          onAnswerSelected: widget.onAnswerSelected,
        ),
      ],
    );
  }
}
