//What is the difference between var and dynamic in Dart? Provide an example of each.

void main() {

  //var is a keyword but dynamic is a data tybe

  // case is var = dynamic
  dynamic example = 'name';
  var example2;
  example2 = 'var is same of dynamic type';
  print(example);
  print(example2);
  // case is var /= dynamic
  dynamic example3 = 13;
  var example4 = ' var in this exapmle is not same dynamic type';
  print(example3);
  print(example4);
}
