import 'dart:io';

void main() {
  String op = stdin.readLineSync()!;

  Map<String, dynamic> task = {};

  List tasks = [];

  int addTask({desc, date, stat}) {
    task = {'desc': desc, 'date': date, 'stat': stat};
    tasks.add(task);
    return 0;
  }

  int removeTask(x) {
    tasks.remove(tasks[x]);
    return 0;
  }

  int editTask({desc, date, stat}) {
    task['desc'] = desc;
    task['date'] = date;
    task['stat'] = stat;
    return 0;
  }

  switch (op) {
    case '+':
      {
        String desc = stdin.readLineSync()!;
        String date = stdin.readLineSync()!;
        bool stat = bool.parse(stdin.readLineSync()!);
        addTask(desc: desc, date: date,stat: stat);
        print(tasks);
      }
      break;

    case '-':
      {
        String x = stdin.readLineSync()!;
        removeTask(x);
        print(tasks);
      }
      break;

    case '*':
      {
        String desc = stdin.readLineSync()!;
        String date = stdin.readLineSync()!;
        bool stat = bool.parse(stdin.readLineSync()!);
        editTask(desc: desc, date: date, stat: stat);
        print(tasks);
      }
      break;
  }
}
