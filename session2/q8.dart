/*
 Nested If for Temperature Ranges
 Objective: Use nested if statements to check multiple conditions.
 Instructions:- Create an integer variable temperature.- If temperature is above 30, print 'It's hot!'.- If it's between 15 and 30, print 'It's warm.'.- Otherwise, print 'It's cold.'
*/
import 'dart:io';

void main() {
  print('enter temperature');
  int temperature = int.parse(stdin.readLineSync()!);
  bool isHot = temperature > 30;
  bool isWarm = temperature <= 30 && temperature >= 15;
  if (isHot) {
    print('It\'s hot!');
  } else if (isWarm) {
    print('It\'s warm');
  } else {
    print('It\'s cold');
  }
}
