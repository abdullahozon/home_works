import 'package:flutter/material.dart';
import 'package:quiz_app/views/home_views.dart';
import 'package:quiz_app/views/legacy/legacy_question_view.dart';
import 'package:quiz_app/views/questions/question_view.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(fontFamily: 'Cairo'),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeViews(),
        '/legacy-quiz': (context) => const LegacyQuestionView(),
        '/questions': (context) => const QuestionView(),
      },
    );
  }
}
