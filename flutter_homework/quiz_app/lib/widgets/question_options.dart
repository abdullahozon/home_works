import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_managaer.dart';

import 'package:quiz_app/widgets/option_item.dart';

class QuestionOptions extends StatefulWidget {
  final int questionIndex;
  final List<String> options;
  final QuestionManager questionManager;
  final VoidCallback onAnswerSelected; // ← جديد

  const QuestionOptions({
    super.key,
    required this.questionIndex,
    required this.options,
    required this.questionManager,

    required this.onAnswerSelected, // ← جديد
  });

  @override
  State<QuestionOptions> createState() => _QuestionOptionsState();
}

class _QuestionOptionsState extends State<QuestionOptions> {
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    // مزامنة الـ selectedIndex مع الإجابة المحفوظة
    final saved =
        widget.questionManager.questions[widget.questionIndex].selectedAnswer;
    if (saved.isNotEmpty) {
      final idx = widget.options.indexOf(saved);
      if (idx != -1) selectedIndex = idx;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.options.length,
      itemBuilder: (context, idx) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AnimateItemOption(
            option: widget.options[idx],
            isSelected: selectedIndex == idx,
            onTap: () {
              setState(() => selectedIndex = idx);
              widget.questionManager.updateAnswer(
                widget.questionIndex,
                widget.options[idx],
              );
              widget.onAnswerSelected(); // ← نخبر الأب أن تبنى نفسها
            },
          ),
        );
      },
    );
  }
}

class AnimateItemOption extends StatelessWidget {
  const AnimateItemOption({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });
  final String option;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedCrossFade(
        firstChild: InActiveOptionItem(option: option),
        secondChild: ActiveOptionItem(option: option),
        crossFadeState:
            isSelected ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: Duration(milliseconds: 300),
      ),
    );
  }
}
