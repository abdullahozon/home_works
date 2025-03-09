
//Given this code, identify any errors and explain why they occur: { String name = "Alice"; name = 123; print(name); }

void main() {
  String name = "Alice";
  name = 123;
  print(name);

  /*
  error 1 is '''
  error 2 : We shouldn't write the word "dart".
  error 3 : The variable name was defined as being of type String, then it was assigned a value of type int, so the error appeared.
  */
}