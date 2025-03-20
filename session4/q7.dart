/*
7. Loops, Conditional Statements & Logical Operators
 Write a program that prints the numbers 1 to 20 but:- If a number is divisible by 3, print "Fizz".- If a number is divisible by 5, print "Buzz".- If a number is divisible by both 3 and 5, print "FizzBuzz".
*/

void main() {
  for (int i = 1; i < 21; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print('$i FizzBuzz');
    } else if (i % 5 == 0) {
      print('$i Buzz');
    } else if (i % 3 == 0) {
      print('$i Fizz');
    }
  }
}
