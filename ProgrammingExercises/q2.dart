/*
 Temperature Converter
 Write a function that converts temperature from Celsius to Fahrenheit and vice versa.
 Accept temperature value and unit ('C' for Celsius, 'F' for Fahrenheit) as inputs.
 Convert accordingly and return the result.
*/
import 'dart:io';

void main() {
  int number = int.parse(stdin.readLineSync()!);
  fToC(number);
  cToF(-12);
}

fToC(var f) {
  num c = (f - 32) / 1.8;
  print(c);
}

cToF(var c) {
  num f = (c * 1.8) + 32;
  print(f);
}
