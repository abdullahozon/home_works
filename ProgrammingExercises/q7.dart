/*
Reverse a String
 Write a function that takes a string as input and returns the string reversed  
Example:
 reverseString('hello') -> 'olleh
*/
import 'dart:io';

void main() {
  String hello = 'hello';
  reverseString(hello);
}

reverseString(String hello) {
  String reverseWored = '';
  for (int i = hello.length - 1; i >= 0; i--) {
    reverseWored = reverseWored + hello[i];
  }
  print(reverseWored);
}
