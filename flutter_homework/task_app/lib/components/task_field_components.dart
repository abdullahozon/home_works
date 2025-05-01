import 'package:flutter/material.dart';

class TaskField extends StatefulWidget {
  final Function(String) onAdd;

  const TaskField({super.key, required this.onAdd});

  @override
  State<TaskField> createState() => _TaskFieldState();
}

class _TaskFieldState extends State<TaskField> {
  final TextEditingController _controller = TextEditingController();

  void handleAdd() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onAdd(text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white54,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Enter your task',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                onSubmitted: (_) => handleAdd(),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 44,
              height: 44,
              child: FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: handleAdd,
                child: const Icon(Icons.add, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
