import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 21.5),
      child: Divider(
        color: Colors.white,
        thickness: 2,
        indent: 150,
        endIndent: 150,
      ),
    );
  }
}
