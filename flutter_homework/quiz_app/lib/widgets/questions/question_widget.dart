import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_managaer.dart';
import 'package:quiz_app/models/questoin_model.dart';
import 'package:quiz_app/styles/app_colors.dart';
import 'package:quiz_app/widgets/custom_background_container.dart';
import 'package:quiz_app/widgets/questions/page_indicator.dart';
import 'package:quiz_app/widgets/questions/question_body._page_view.dart';
import 'package:quiz_app/widgets/questions/question_navigator_action_buttons.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({Key? key}) : super(key: key);

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  final QuestionManager _qm = QuestionManager(questions);
  late final PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void _onPageChanged(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onAnswerSelected() {
    // إعادة بناء لتمكين زر التالي فور اختيار الإجابة
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final total = _qm.total;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: CustomBackgroundContainer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 24),

                // جسم الأسئلة
                Expanded(
                  child: QuestionBodyPageView(
                    pageController: _pageController,
                    questionManager: _qm,
                    onAnswerSelected: _onAnswerSelected,
                    onPageChanged: _onPageChanged,
                  ),
                ),

                const SizedBox(height: 12),

                // مؤشر النقاط
                PageIndicator(
                  controller: _pageController,
                  total: total,
                ),

                const SizedBox(height: 20),

                // أزرار التنقل
                QuestionNavigatorActionButtons(
                  pageController: _pageController,
                  currentPage: _pageIndex,
                  questionManager: _qm,
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}