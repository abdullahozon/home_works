import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  const CircleButton({
    super.key,
    required this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      shape: const CircleBorder(),
      backgroundColor: const Color(0xFF4b4e5f),
      onPressed: onPressed,
      child: Icon(iconData, color: Colors.white),
    );
  }
}
