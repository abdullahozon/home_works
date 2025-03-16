void main() {
  Map<String, dynamic> student = {};
  student['name'] = 'Abdullah';
  print(student);
  student['old'] = '25';
  student.forEach((key, value) {
    print('$key : $value');
  });
}
