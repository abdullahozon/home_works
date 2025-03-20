/*
 2. Arithmetic Operators, Conditional Statements & Functions
 Write a function `calculateBonus(int salary, int yearsWorked)` that calculates a
 bonus based on the following rules:- If the employee has worked for 5 or more years, they get a 10% bonus.- Otherwise, they get a 5% bonus.
 The function should return the bonus amount.
 Then, call the function inside `main()` and print the result
 */

import 'dart:io';

void main() {
  print('enter a salary of worker');
  int salary = int.parse(stdin.readLineSync()!);
  print('enter years of work');
  int yearsOfWork = int.parse(stdin.readLineSync()!);
  calculateBonus(yearsOfWork, salary);
}

void calculateBonus(int yearsOfWork, int salary) {
  bool isGreterthanFiveYears = yearsOfWork >= 5;
  double bonus = 0;
  if (isGreterthanFiveYears) {
    bonus = salary * 10 / 100;
    print('your bonus 10% and salary equal ${bonus+salary} ');
  } else {
    bonus = salary * 5 / 100;
    print('5%');
  }
}
