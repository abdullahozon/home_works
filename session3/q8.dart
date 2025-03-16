import 'dart:io';

void main() {
    print('enter a number');
  int num = int.parse(stdin.readLineSync()!);
  bool isRange = 5 < num && 100 >= num;
  if (isRange) {
    print('your number is include the range');
  } else {
    print('Oops!.. your number is not include the range');
  }
}
