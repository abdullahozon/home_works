/*
 If Condition with String Comparison
 Objective: Use if to check string equality.
 Instructions:- Create a string variable password and set it to 'secret'.- If password equals 'secret', print 'Access granted', otherwise print 'Access denied'
*/

import 'dart:io';

void main() {
  String password = 'secret';
  print('enter your password');
  String? userpass = stdin.readLineSync();
  bool isGranted = userpass == password;
  if (isGranted) {
    print('Access granted');
  } else {
    print('Access denied');
  }
}
