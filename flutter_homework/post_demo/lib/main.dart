import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Center(child: HomeScreen())));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Center(
            child: Text('Flutter layout demo', style: TextStyle(fontSize: 24)),
          ),
          SizedBox(height: 10),
          Image.asset('images/img1.JPG'),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Oeschinen Lake Campground',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Kandersteg, Switzerland',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.star, color: Colors.red),
                    Text('41'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconText(icon: Icons.phone, text: 'CALL'),
                      IconText(icon: Icons.route, text: 'ROUTE'),
                      IconText(icon: Icons.share, text: 'SHARE'),
                    ],
                  ),
                ),
                Text(
                  'Lorem Ipsum is simply dummy text typesetting industry. Lorem Ipsum has been the industry\'s dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also typesetting, remaining essentially unchanged. It was popularised of Letraset sheets containing Lorem Ipsum passages.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IconText extends StatelessWidget {
  final String text;
  final IconData icon;
  const IconText({super.key, required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.grey[700]),
        SizedBox(height: 8),
        Text(text, style: TextStyle(color: Colors.grey[700])),
      ],
    );
  }
}
