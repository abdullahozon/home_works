import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_managaer.dart';
import 'package:quiz_app/models/questoin_model.dart';

import 'package:quiz_app/styles/app_colors.dart';
import 'package:quiz_app/widgets/custom_background_container.dart';
import 'package:quiz_app/widgets/question_action_buttons.dart';
import 'package:quiz_app/widgets/question_item.dart';
import 'package:quiz_app/views/results_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LegacyQuestionView extends StatefulWidget {
  const LegacyQuestionView({super.key});

  @override
  _LegacyQuestionViewState createState() => _LegacyQuestionViewState();
}

class _LegacyQuestionViewState extends State<LegacyQuestionView> {
  final QuestionManager questionManager = QuestionManager(questions);
  late final PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void _onAnswerSelected() {
    // يعيد بناء الشاشة من أجل تفعيل زر التالي مباشرة
    setState(() {});
  }

  void _onNext() {
    final isLast = currentIndex == questionManager.questions.length - 1;
    if (isLast) {
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text('Confirm'),
              content: const Text('Are you sure you want to finish the test?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) =>
                                ResultsView(questionManager: questionManager),
                      ),
                    );
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
      );
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _onBack() {
    if (currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = questionManager.questions.length;
    final q = questionManager.questions[currentIndex];
    final canGoBack = currentIndex > 0;
    final hasAnswered = q.selectedAnswer.isNotEmpty;
    final isLast = currentIndex == total - 1;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: CustomBackgroundContainer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 24),

                // PageView
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: total,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: _onPageChanged,
                    itemBuilder: (context, index) {
                      return QuestionItem(
                        questionManager: questionManager,
                        index: index,
                        questionModel: questionManager.questions[index],
                        onAnswerSelected: _onAnswerSelected, // ← هنا
                      );
                    },
                  ),
                ),

                const SizedBox(height: 12),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: total,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.secondaryColor,
                    dotColor: Colors.white54,
                    dotHeight: 8,
                    dotWidth: 8,
                    expansionFactor: 2,
                    spacing: 8,
                  ),
                  onDotClicked: (idx) {
                    _pageController.animateToPage(
                      idx,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),

                const SizedBox(height: 20),

                QuestionActionButtons(
                  onBackPressed: _onBack,
                  onNextPressed: _onNext,
                  canGoBack: canGoBack,
                  canGoNext: hasAnswered,
                  isLast: isLast,
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
