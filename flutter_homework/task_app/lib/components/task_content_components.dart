import 'package:flutter/material.dart';
import 'package:task_app/components/no_task_widget.dart';
import 'package:task_app/components/task_card_widget.dart';
import 'package:task_app/models/task_item_model.dart';

class TaskContent extends StatelessWidget {
  final List<TaskItem> tasks;
  final Function(TaskItem) onToggle;
  final Function(TaskItem) onRemove;
  
  const TaskContent({
    super.key,
    required this.tasks,
    required this.onToggle,
    required this.onRemove,
    
  });

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return Center(child: NoTaskWidget());
    }

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskCardWidget(
          tasks: tasks,
          onToggle: onToggle,
          onRemove: onRemove,
          task: task,
        );
      },
    );
  }
}
