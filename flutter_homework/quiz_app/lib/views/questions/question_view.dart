import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_managaer.dart';
import 'package:quiz_app/models/questoin_model.dart';
import 'package:quiz_app/views/questions/question_body.dart';
import 'package:quiz_app/views/questions/page_indicator.dart';
import 'package:quiz_app/views/questions/question_navigator.dart';
import 'package:quiz_app/styles/app_colors.dart';
import 'package:quiz_app/widgets/custom_background_container.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({Key? key}) : super(key: key);

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  final QuestionManager _qm = QuestionManager(questions);
  final ValueNotifier<int> _pageIndex = ValueNotifier<int>(0);
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0)..addListener(() {
      final idx = (_pageController.page ?? 0).round();
      _pageIndex.value = idx;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _pageIndex.dispose();
    super.dispose();
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

                // الجسم الذي يحتوي على PageView
                Expanded(
                  child: QuestionBody(
                    pageController: _pageController,
                    questionManager: _qm,
                    onAnswerSelected: () {
                      _pageIndex.notifyListeners();
                    },
                  ),
                ),

                const SizedBox(height: 12),

                // مؤشر النقاط
                PageIndicator(
                  controller: _pageController,
                  pageIndex: _pageIndex,
                  total: total,
                ),

                const SizedBox(height: 20),

                // أزرار التنقل
                QuestionNavigator(
                  pageController: _pageController,
                  pageIndex: _pageIndex,
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
