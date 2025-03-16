void main() {
  Human abdullah = Human();
  abdullah.skincolor = 'blue';
  abdullah.age = 30;
  abdullah.play();
}

class Human {
  String? skincolor;
  int? age;

  void play() {
    print('your age is :$age , color: $skincolor');
  }
}
