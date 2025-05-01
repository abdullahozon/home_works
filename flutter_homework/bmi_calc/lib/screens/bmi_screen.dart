import 'package:flutter/material.dart';
import '../models/gender_type.dart';
import '../widgets/gender_card.dart';
import '../widgets/height_slider.dart';
import '../widgets/number_card.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final Color bgAppColor = const Color(0xFF04061d);
  final Color highlightedColor = const Color(0xFFed0d54);
  final Color textColor = Colors.white;

  int weight = 40;
  int age = 18;
  int height = 140;
  GenderType? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgAppColor,
      appBar: AppBar(
        backgroundColor: bgAppColor,
        title: Text('BMI CALCULATE', style: TextStyle(color: textColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  GenderType.values.map((gender) {
                    return GenderCard(
                      gender: gender,
                      isSelected: selectedGender == gender,
                      onTap: () {
                        setState(() {
                          selectedGender = gender;
                        });
                      },
                    );
                  }).toList(),
            ),
            const SizedBox(height: 20),
            HeightSlider(
              height: height,
              onChanged: (val) => setState(() => height = val),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NumberCard(
                  label: 'WEIGHT',
                  value: weight,
                  onIncrement: () => setState(() => weight++),
                  onDecrement: () => setState(() => weight--),
                ),
                NumberCard(
                  label: 'AGE',
                  value: age,
                  onIncrement: () => setState(() => age++),
                  onDecrement: () => setState(() => age--),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: highlightedColor,
                ),
                onPressed: () {},
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 30, color: Color(0XFFeeeeee)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
