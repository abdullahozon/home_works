import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/constants/assets.dart';
import 'package:quiz_app/styles/app_colors.dart';
import 'package:quiz_app/styles/app_text_styles.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({super.key, required this.option});
  final String option;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(Assets.imageCircle),
          // Container(
          //   width: 19,
          //   height: 19,
          //   padding: const EdgeInsets.all(5),
          //   decoration: ShapeDecoration(
          //     shape: RoundedRectangleBorder(
          //       side: BorderSide(width: 1, color: const Color(0XFF2B0062)),
          //       borderRadius: BorderRadius.circular(9.50),
          //     ),
          //   ),
          // ),
          Text(
            option,
            style: AppTextStyles.medium16(color: const Color(0xFF2B0062)),
          ),
        ],
      ),
    );
  }
}

class ActiveOptionItem extends StatelessWidget {
  const ActiveOptionItem({super.key, required this.option});
  final String option;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        gradient: LinearGradient(
          begin: Alignment(0.00, 1.00),
          end: Alignment(1.00, 0.17),
          colors: [const Color(0xFFB8B2FF), const Color(0xFFC6C2F7)],
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          Container(
            width: 19,
            padding: const EdgeInsets.all(5),
            decoration: ShapeDecoration(
              color: const Color(0xFF2B0062),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.5),
              ),
            ),
            child: SvgPicture.asset(Assets.imageCheckicon),
          ),
          Text(
            option,
            style: AppTextStyles.medium16(color: AppColors.primaryColor),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class InActiveOptionItem extends StatelessWidget {
  const InActiveOptionItem({super.key, required this.option});
  final String option;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          Container(
            width: 19,
            height: 19,
            padding: const EdgeInsets.all(5),
            decoration: ShapeDecoration(
              // color: const Color(0xFF2B0062),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9.5),
                side: BorderSide(width: 1, color: const Color(0xFF2B0062)),
              ),
            ),
            // child: SvgPicture.asset(Assets.imageCircle),
          ),
          Text(
            option,
            style: AppTextStyles.medium16(color: AppColors.primaryColor),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
