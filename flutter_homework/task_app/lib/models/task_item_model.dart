class TaskItem {
  final String description;
  final String date;
  bool isDone;

  TaskItem({
    required this.description,
    required this.date,
    this.isDone = false,
  });
}
