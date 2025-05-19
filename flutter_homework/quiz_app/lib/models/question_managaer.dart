// import 'package:quiz_app/models/questoin_model.dart';

// class QuestionManagaer {
//   final List<QuestionModel> questions;

//   QuestionManagaer(this.questions);

//   updateQuestion(QuestionModel question, String selectedAnswer) {
//     question.selectedAnswer = selectedAnswer;
//     var itemIndex = questions.indexOf(question);
//     questions.remove(question);
//     questions.insert(itemIndex, question);
//   }
// }
//

import 'package:quiz_app/models/questoin_model.dart';

class QuestionManager {
  final List<QuestionModel> questions;

  int get total => questions.length;

  bool canGoNext(int index) => questions[index].selectedAnswer.isNotEmpty;

  bool isLast(int index) => index == total - 1;

  bool canGoBack(int index) => index > 0;

  QuestionManager(this.questions);

  void updateAnswer(int index, String selectedAnswer) {
    questions[index].selectedAnswer = selectedAnswer;
  }

  void reset() {
    for (var q in questions) {
      q.selectedAnswer = '';
    }
  }

  int get correctCount =>
      questions.where((q) => q.selectedAnswer == q.correctAnswer).length;
}
