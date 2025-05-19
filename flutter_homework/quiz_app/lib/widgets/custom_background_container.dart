import 'package:flutter/material.dart';
import 'package:quiz_app/constants/assets.dart';

class CustomBackgroundContainer extends StatelessWidget {
  const CustomBackgroundContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [Image.asset(Assets.imagePngGradient), child]);
  }
}
