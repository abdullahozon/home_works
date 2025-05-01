import 'package:flutter/material.dart';
import 'circle_button.dart';

class NumberCard extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const NumberCard({
    super.key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 160,
      decoration: BoxDecoration(
        color: const Color(0xFF17172f),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(color: Colors.white)),
          Text(
            '$value',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleButton(iconData: Icons.remove, onPressed: onDecrement),
              const SizedBox(width: 20),
              CircleButton(iconData: Icons.add, onPressed: onIncrement),
            ],
          ),
        ],
      ),
    );
  }
}
