import 'dart:io';

void main() {
  print('enter a number');
  num num1 = num.parse(stdin.readLineSync()!);
  print('enter an operator mark');
  String op = stdin.readLineSync()!;
  print('enter a number');
  num num2 = num.parse(stdin.readLineSync()!);
  bool isOneChar = op.length == 1;

  if (isOneChar) {
    switch (op) {
      case '+':
        print(sum(num1, num2));
      case '-':
        print(tarh(num1, num2));
      case '*':
        print(darb(num1, num2));
      case '/':
        print(kisma(num1, num2));
    }
  }
}

num sum(num num1, num num2) {
  num sum = num1 + num2;
  return sum;
}

num darb(num num1, num num2) {
  num darb = num1 * num2;
  return darb;
}

num tarh(num num1, num num2) {
  num tarh = num1 - num2;
  return tarh;
}

num kisma(num num1, num num2) {
  double kisma = num1 / num2;
  return kisma;
}
