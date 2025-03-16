import 'dart:io';

void main() {
  int num;

  print('Enter Positive Number');
  num = int.parse(stdin.readLineSync()!);
  if (num > 0) {
    print('num is positive');
  } else if (num < 0) {
    print('num is negative');
  } else {
    print('num is 0');
  }
}
