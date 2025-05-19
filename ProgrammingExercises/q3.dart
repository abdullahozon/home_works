/*
 Check Leap Year
 Write a function that determines if a given year is a leap year.
 A year is a leap year if it is divisible by 4 but not divisible by 100, except if it is also divisible by 400.
*/

void main() {
  num x = 2025;
  if (x % 4 == 0 && x % 100 != 0 || x % 400 == 0) {
    print('leap');
  } else {
    print('Not leap');
  }
}
