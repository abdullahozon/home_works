import 'package:flutter/material.dart';

enum GenderType { male, female }

extension GenderExtension on GenderType {
  String get label => this == GenderType.male ? 'MALE' : 'FEMALE';
  Color get color =>
      this == GenderType.male
          ? const Color.fromARGB(255, 41, 132, 178)
          : const Color.fromARGB(255, 215, 68, 117);
  IconData get icon => this == GenderType.male ? Icons.male : Icons.female;
}
