import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle medium24({Color? color}) {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.white,
    );
  }

  static TextStyle medium18({Color? color}) {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.white,
    );
  }

  static TextStyle regular16({Color? color}) {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: color ?? Colors.white,
    );
  }

  static TextStyle medium16({Color? color}) {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color ?? Colors.white,
    );
  }

  static TextStyle regular12({Color? color}) {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: color ?? Colors.white,
    );
  }
}
