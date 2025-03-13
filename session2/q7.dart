/*
 If-Else with Grades
 Objective: Practice conditional statements with integer values.
 Instructions:- Create an integer variable marks.- If marks is 70 or higher, print 'Passed', otherwise print 'Failed'
*/

import 'dart:io';

void main() {
  print('enter your mark');
  int marks = int.parse(stdin.readLineSync()!);
  bool isPassed = marks >= 70;
  if (isPassed) {
    print('Passed');
  } else {
    print('Failed');
  }
}
