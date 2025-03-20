/*
Create a class `Person` with the following attributes:- `String name`- `int? age` (nullable)- `bool isStudent` (default is false)
 Implement:- A constructor that initializes `name` and `age`.- A method `displayInfo()` that prints the person's details.
 In `main()`, create an instance of `Person` and call `displayInfo()`.
*/

void main() {
  Person Ahmed = Person('Ahmed', 15, true);
  Ahmed.displayInfo();
}

class Person {
  String name;
  int? age;
  bool isStudent = false;
  Person(this.name, this.age,this.isStudent);
  void displayInfo() {
    if (isStudent) {
      print('Your Name is $name and Your age is $age and your are not student');
    } else {
      print('Your Name is $name and Your age is $age and your are student');
    }
  }
}
