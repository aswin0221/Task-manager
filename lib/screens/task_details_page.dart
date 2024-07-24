import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/components/category_card.dart';
import 'package:task_manager/components/task_progress_card.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/models/tasks_model.dart';

class TaskDetailsPage extends StatelessWidget {
  final TasksModel task;

  const TaskDetailsPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    List taskProgress = task.taskProgress;
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset("assets/icons/chat.svg"),
          )),
        ],
        title: const Text(
          "Task Details",
          style: TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          children: [
            Text(
              task.name,
              style: TextStyle(fontSize: 28, color: taskColors[0],fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                categoryCard(task.workTitle, taskColors[0]),
                const SizedBox(
                  width: 8,
                ),
                categoryCard(task.priority, taskColors[0]),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Additional Information",
              style: TextStyle(color: Colors.grey.shade300),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              task.workDescription,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Task Progress",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: taskProgress.length,
              itemBuilder: (context, index) {
                return TaskProgressCard(
                    isCompleted: taskProgress[index]["isCompleted"],
                    title: taskProgress[index]["title"],
                    description: taskProgress[index]["description"],
                    startTime: taskProgress[index]["startTime"],
                    endTime: taskProgress[index]["endTime"]);
              },
            )
          ],
        ),
      ),
    );
  }
}
