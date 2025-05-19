import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/constants/assets.dart';
import 'package:quiz_app/models/questoin_model.dart';
import 'package:quiz_app/styles/app_colors.dart';
import 'package:quiz_app/styles/app_text_styles.dart';

class QuestionHeader extends StatelessWidget {
  const QuestionHeader({
    super.key,
    required this.index,
    required this.questionModel,
  });
  final int index;
  final QuestionModel questionModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 130,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.questionColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              SvgPicture.asset(getImage, width: 18),
              Text(
                '   Question ${index + 1}',
                style: AppTextStyles.regular12(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String get getImage {
    switch (index) {
      case 0:
        return Assets.imageQ1;
      case 1:
        return Assets.imageQ2;
      case 2:
        return Assets.imageQ3;
      case 3:
        return Assets.imageQ4;
      default:
        return Assets.imageQ1;
    }
  }
}
