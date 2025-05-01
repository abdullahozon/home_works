import 'package:task_app/models/task_item_model.dart';

class TasksManager {
  final List<TaskItem> tasks = [];

  void addTask(TaskItem task) {
    tasks.add(task);
  }

  void removeTask(TaskItem task) {
    tasks.removeWhere((item) => item == task);
  }

  // void updateTask(TaskItem task) {
  // }
}
