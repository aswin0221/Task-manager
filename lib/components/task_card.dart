import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/components/category_card.dart';
import 'package:task_manager/helpers/my_navigation.dart';
import 'package:task_manager/models/tasks_model.dart';
import 'package:task_manager/screens/task_details_page.dart';

class TaskCard extends StatelessWidget {
  final Color color;
  final TasksModel task;

  const TaskCard({super.key, required this.color, required this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MyNavigation.pushNavigation(
            context,
            TaskDetailsPage(
              task: task,
            ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.workTitle,
                  style: const TextStyle(
                      color: Colors.black26, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                    child: SvgPicture.asset(
                  "assets/icons/three-dots-menu.svg",
                  width: 25,
                ))
              ],
            ),
            Text(
              task.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.75,
              child: Text(
                task.workDescription,
                style: const TextStyle(
                  color: Colors.black38,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                categoryCard(task.priority,Colors.black87),
                IconButton.filled(
                    padding: const EdgeInsets.all(12),
                    style: IconButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      MyNavigation.pushNavigation(
                          context,
                          TaskDetailsPage(
                            task: task,
                          ));
                    },
                    icon: Transform.rotate(
                        angle: 18,
                        child: const Icon(Icons.arrow_forward_outlined)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
