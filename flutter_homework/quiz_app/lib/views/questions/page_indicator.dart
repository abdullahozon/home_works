import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:quiz_app/styles/app_colors.dart';

class PageIndicator extends StatelessWidget {
  final PageController controller;
  final ValueNotifier<int> pageIndex;
  final int total;

  const PageIndicator({
    Key? key,
    required this.controller,
    required this.pageIndex,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: pageIndex,
      builder: (_, idx, __) {
        return SmoothPageIndicator(
          controller: controller,
          count: total,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColors.secondaryColor,
            dotColor: Colors.white54,
            dotHeight: 8,
            dotWidth: 8,
            expansionFactor: 2,
            spacing: 8,
          ),
          onDotClicked: (newIndex) {
            controller.animateToPage(
              newIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        );
      },
    );
  }
}
