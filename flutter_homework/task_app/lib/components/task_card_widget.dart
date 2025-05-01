import 'package:flutter/material.dart';
import 'package:task_app/models/task_item_model.dart';

class TaskCardWidget extends StatelessWidget {
  final List<TaskItem> tasks;
  final Function(TaskItem) onToggle;
  final Function(TaskItem) onRemove;
  final TaskItem task;
  const TaskCardWidget({
    super.key,
    required this.tasks,
    required this.onToggle,
    required this.onRemove,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFEEEEEE),
      child: ListTile(
        leading: Checkbox(
          value: task.isDone,
          activeColor: Colors.green,
          onChanged: (_) => onToggle(task),
        ),
        title: Text(
          task.description,
          style: TextStyle(
            decoration:
                task.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        subtitle: Text(task.date),
        trailing: GestureDetector(
          onTap: () => onRemove(task),
          child: const Icon(Icons.delete_outline, color: Colors.red),
        ),
      ),
    );
  }
}
