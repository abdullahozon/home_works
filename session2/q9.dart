/*
 Switch Case with Seasons
 Objective: Use switch for multiple cases.
 Instructions:- Create an integer variable month with a value between 1 and 12.- Use a switch statement to print the season based on the month
*/
import 'dart:io';

void main() {
  print('enter a number of month');
  int month = int.parse(stdin.readLineSync()!);
  switch (month) {
    case 1:
    case 2:
    case 3:
      print('the season of $month is Spring');
      break;
    case 4:
    case 5:
    case 6:
      print('the season of $month is Summer');
      break;
    case 7:
    case 8:
    case 9:
      print('the season of $month is Autumn');
      break;
    case 10:
    case 11:
    case 12:
      print('the season of $month is ًWinter');
      break;
    default:
      print("$month's month is not found .. enter a real month");
  }
}
