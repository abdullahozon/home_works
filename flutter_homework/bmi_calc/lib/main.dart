import 'package:flutter/material.dart';

void main() {
  runApp(BMI());
}

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  _BMIState();
  final Color bgAppColor = Color(0xFF04061d);
  final Color itemBgColor = Color(0xFF17172f);
  final Color highlightedColor = Color(0xFFed0d54);
  final Color circleBtnBgColor = Color(0xFF4b4e5f);
  final Color textColor = Colors.white;
  int weight = 40;
  int age = 18;
  int height = 140;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgAppColor,
        appBar: AppBar(
          backgroundColor: bgAppColor,
          title: Text('BMI CALCULATE', style: TextStyle(color: textColor)),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color:
                                isSelected
                                    ? const Color.fromARGB(255, 41, 132, 178)
                                    : itemBgColor,
                          ),

                          width: 180,
                          height: 160,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.male, color: textColor, size: 100),
                              Text('MALE', style: TextStyle(color: textColor)),
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color:
                                !isSelected
                                    ? const Color.fromARGB(255, 215, 68, 117)
                                    : itemBgColor,
                          ),

                          width: 180,
                          height: 160,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.female, color: textColor, size: 100),
                              Text(
                                'FEMALE',
                                style: TextStyle(color: textColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: itemBgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 12),
                        Text('HEIGHT', style: TextStyle(color: textColor)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$height",
                              style: TextStyle(
                                color: textColor,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(' cm', style: TextStyle(color: textColor)),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 16.0,
                            ),
                            overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 24.0,
                            ),
                            thumbColor: highlightedColor,
                            activeTrackColor: textColor,
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 0,
                            max: 200,
                            onChanged: (value) {
                              setState(() {
                                height = value.toInt();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 180,
                        height: 160,
                        decoration: BoxDecoration(
                          color: itemBgColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT', style: TextStyle(color: textColor)),
                            Text(
                              '$weight',
                              style: TextStyle(
                                color: textColor,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleButton(
                                  iconData: Icons.remove,
                                  number: weight,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(width: 20),
                                CircleButton(
                                  iconData: Icons.add,
                                  number: weight,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 160,
                        decoration: BoxDecoration(
                          color: itemBgColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE', style: TextStyle(color: textColor)),
                            Text(
                              '$age',
                              style: TextStyle(
                                color: textColor,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleButton(
                                  iconData: Icons.remove,
                                  number: age,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(width: 20),

                                CircleButton(
                                  iconData: Icons.add,
                                  number: age,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: Container(
                height: 40,
                color: highlightedColor,
                child: MaterialButton(
                  onPressed: (() {}),
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.number,
    required this.onPressed,
    required this.iconData,
  });
  final IconData iconData;
  final int number;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: Color(0xFF4b4e5f),
      onPressed: onPressed,
      child: Icon(iconData, color: Colors.white),
    );
  }
}
