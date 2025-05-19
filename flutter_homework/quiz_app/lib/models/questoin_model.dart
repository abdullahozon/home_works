import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class QuestionModel extends Equatable {
  final String question;
  final List<String> options;
  final String correctAnswer;
  String selectedAnswer;
  QuestionModel({
    required this.question,
    required this.options,
    required this.correctAnswer,
    this.selectedAnswer = '',
  });

  @override
  // TODO: implement props
  List<Object?> get props => [question, options, correctAnswer];
}

List<QuestionModel> questions = [
  QuestionModel(
    question: 'Which of the following widgets cannot be preceded by const?',
    options: ['SizedBox', 'Text', 'Container', 'Row'],
    correctAnswer: 'Container',
  ),
  QuestionModel(
    question:
        'What widget adds space above and below the app to prevent overlap if there is no AppBar?',
    options: ['Padding', 'SafeArea', 'Center', 'Expanded'],
    correctAnswer: 'SafeArea',
  ),
  QuestionModel(
    question:
        'Which of the following functions is not part of the State of a StatefulWidget?',
    options: ['createState', 'initState', 'build', 'setState'],
    correctAnswer: 'createState',
  ),
  QuestionModel(
    question: 'What function is executed first when the project is created?',
    options: ['build', 'dispose', 'Center', 'initState'],
    correctAnswer: 'initState',
  ),
];
