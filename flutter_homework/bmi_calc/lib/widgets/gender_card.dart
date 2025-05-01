import 'package:flutter/material.dart';
import '../models/gender_type.dart';

class GenderCard extends StatelessWidget {
  final GenderType gender;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderCard({
    super.key,
    required this.gender,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 160,
        decoration: BoxDecoration(
          color: isSelected ? gender.color : const Color(0xFF17172f),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(gender.icon, color: Colors.white, size: 100),
            Text(gender.label, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
