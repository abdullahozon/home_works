/*
Sum of List Elements
 Write a function that takes a list of numbers and returns the sum of all elements.
 Example:
 sumList([1, 2, 3, 4, 5]) -> 15
*/
import 'dart:io';

void main() {
  var listOfNumbers = [1, 2, 3, 4, 5];
  sumList(listOfNumbers);
}

sumList(List listOfNumbers) {
  int sum = 0;
  for (int element in listOfNumbers) {
    sum = sum + element;
  }
  print(sum);
}
