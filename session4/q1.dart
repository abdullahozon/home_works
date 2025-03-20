/*
 1. Variables, Data Types & Print Statement
 Create a Dart program that declares and initializes the following variables:- Your name (String)- Your age (int)- Your height (double)- Whether you are a student (bool)
 Then, print these values using a single print statement
*/
import 'dart:io';

void main() {
  print('enter your name');
  String name = stdin.readLineSync()!;
  print('enter your age');
  int age = int.parse(stdin.readLineSync()!);
  print('enter your height');
  double height = double.parse(stdin.readLineSync()!);
  print('if you are a student enter "true" , or "false" if you\'r not');
  bool isStudent = bool.parse(stdin.readLineSync()!);
  if(isStudent) {
  print('your name is $name , your age is $age , your height is $height and you are a student');
  } else {
  print('your name is $name , your age is $age , your height is $height and you are not a student');
  };
}
