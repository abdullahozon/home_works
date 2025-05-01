import 'package:flutter/material.dart';
import 'package:task_app/components/task_field_components.dart';
import 'package:task_app/models/task_item_model.dart';
import 'package:task_app/components/task_content_components.dart';
import 'package:task_app/models/task_manager_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TasksManager tasksManager = TasksManager();
  void addTask(String description) {
    final newTask = TaskItem(
      description: description,
      date: DateTime.now().toString(),
      isDone: false,
    );
    setState(() {
      tasksManager.addTask(newTask);
    });
  }

  void toggleTask(TaskItem task) {
    setState(() {
      task.isDone = !task.isDone;
      // tasksManager.updateTask(task);
    });
  }

  void removeTask(TaskItem task) {
    setState(() {
      tasksManager.removeTask(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: const Text(
          'My Tasks',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TaskContent(
              tasks: tasksManager.tasks,
              onToggle: toggleTask,
              onRemove: removeTask, 
            ),
          ),
          TaskField(onAdd: addTask),
        ],
      ),
    );
  }
}
