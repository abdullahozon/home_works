import 'package:flutter/material.dart';

class HeightSlider extends StatelessWidget {
  final int height;
  final ValueChanged<int> onChanged;

  const HeightSlider({
    super.key,
    required this.height,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF17172f),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          const Text('HEIGHT', style: TextStyle(color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$height",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(' cm', style: TextStyle(color: Colors.white)),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              thumbColor: const Color(0xFFed0d54),
              activeTrackColor: Colors.white,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 16),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 24),
            ),
            child: Slider(
              value: height.toDouble(),
              min: 0,
              max: 200,
              onChanged: (value) => onChanged(value.toInt()),
            ),
          ),
        ],
      ),
    );
  }
}
