import 'package:flutter/material.dart';

void main() {
  runApp(PointsCounter());
}

class PointsCounter extends StatefulWidget {
  const PointsCounter({super.key});

  @override
  State<PointsCounter> createState() => _PointsCounterState();
}

class _PointsCounterState extends State<PointsCounter> {
  int teamApoint = 0;
  int teamBpoint = 0;
  final Color mainColor = Colors.orange;
  final Color textColor = Colors.black;
  final Color backgroundApp = Colors.white70;

  final Color darkMainColor = const Color.fromARGB(255, 174, 106, 5);
  final Color darkTextColor = Colors.white70;
  final Color darkBackgroundApp = Colors.black;

  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: isDarkMode ? darkBackgroundApp : backgroundApp,
        appBar: AppBar(
          actionsPadding: EdgeInsets.only(right: 10),
          actions: [
            GestureDetector(
              onTap:
                  () => setState(() {
                    isDarkMode = !isDarkMode;
                  }),
              child: Icon(
                Icons.dark_mode,
                color: isDarkMode ? darkTextColor : textColor,
              ),
            ),
          ],
          backgroundColor: isDarkMode ? darkMainColor : mainColor,
          title: Text(
            'Points Counter',
            style: TextStyle(color: isDarkMode ? darkTextColor : textColor),
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Team A',
                      style: TextStyle(
                        fontSize: 32,
                        color: isDarkMode ? darkTextColor : textColor,
                      ),
                    ),
                    Text(
                      '$teamApoint',
                      style: TextStyle(
                        fontSize: 150,
                        color: isDarkMode ? darkTextColor : textColor,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: isDarkMode ? darkTextColor : textColor,
                        backgroundColor: isDarkMode ? darkMainColor : mainColor,
                        minimumSize: Size(150, 50),
                      ),
                      onPressed: () {
                        setState(() {
                          teamApoint++;
                        });
                      },
                      child: Text(
                        'Add 1 Point',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: isDarkMode ? darkTextColor : textColor,
                        backgroundColor: isDarkMode ? darkMainColor : mainColor,
                        minimumSize: Size(150, 50),
                      ),
                      onPressed: () {
                        setState(() {
                          teamApoint += 2;
                        });
                      },
                      child: Text(
                        'Add 2 Point',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: isDarkMode ? darkTextColor : textColor,
                        backgroundColor: isDarkMode ? darkMainColor : mainColor,
                        minimumSize: Size(150, 50),
                      ),
                      onPressed: () {
                        setState(() {
                          teamApoint += 3;
                        });
                      },
                      child: Text(
                        'Add 3 Point',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                SizedBox(
                  height: 500,
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 60,
                    endIndent: 60,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Team B',
                      style: TextStyle(
                        fontSize: 32,
                        color: isDarkMode ? darkTextColor : textColor,
                      ),
                    ),
                    Text(
                      '$teamBpoint',
                      style: TextStyle(
                        fontSize: 150,
                        color: isDarkMode ? darkTextColor : textColor,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: isDarkMode ? darkTextColor : textColor,
                        backgroundColor: isDarkMode ? darkMainColor : mainColor,
                        minimumSize: Size(150, 50),
                      ),
                      onPressed: () {
                        setState(() {
                          teamBpoint++;
                        });
                      },
                      child: Text(
                        'Add 1 Point',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: isDarkMode ? darkTextColor : textColor,
                        backgroundColor: isDarkMode ? darkMainColor : mainColor,
                        minimumSize: Size(150, 50),
                      ),
                      onPressed: () {
                        setState(() {
                          teamBpoint += 2;
                        });
                      },
                      child: Text(
                        'Add 2 Point',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: isDarkMode ? darkTextColor : textColor,
                        backgroundColor: isDarkMode ? darkMainColor : mainColor,
                        minimumSize: Size(150, 50),
                      ),
                      onPressed: () {
                        setState(() {
                          teamBpoint += 3;
                        });
                      },
                      child: Text(
                        'Add 3 Point',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: isDarkMode ? darkTextColor : textColor,
                backgroundColor: isDarkMode ? darkMainColor : mainColor,
                minimumSize: Size(150, 50),
              ),
              onPressed: () {
                setState(() {
                  teamApoint = 0;
                  teamBpoint = 0;
                });
              },
              child: Text('Reset', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
