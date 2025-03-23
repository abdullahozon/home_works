/*
Find Prime Numbers in a Range
 Write a function that takes two numbers (start, end) and returns a list of all prime numbers between
 them.
 Ensure that the function correctly identifies prime numbers and handles edge cases where start is
 greater than end.
*/
import 'dart:io';

void main() {
    int start = int.parse(stdin.readLineSync()!);
  int end = int.parse(stdin.readLineSync()!);
  List primeNumber = primeNumbers(start, end);
  print(primeNumber);
}

List primeNumbers(start, end) {

  List listOfPrime = [];
  for (int i = end; i >= start; i--) {
    bool isPrime = true;
    for (int j = 2; j < i; j++) {
      if (i % j == 0) {
        isPrime = false;
        break;
      }
     
    } if (isPrime && i > 1) {
         listOfPrime.add(i);
      }
  }
  return listOfPrime;
}

