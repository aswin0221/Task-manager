class TasksModel {
  final String name;
  final String workTitle;
  final String workDescription;
  final String priority;
  final DateTime taskDate;
  final List taskProgress;

  TasksModel(
      {required this.workTitle,
      required this.name,
      required this.workDescription,
      required this.priority,
      required this.taskDate,
      required this.taskProgress});

  static TasksModel fromMap(Map task) {
    return TasksModel(
        name: task["name"],
        workDescription: task["workDescription"],
        workTitle: task['workTitle'],
        priority: task["priority"],
        taskDate: task["taskDate"],
        taskProgress: task["taskProgress"]);
  }
}
