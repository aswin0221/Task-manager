import 'package:flutter/material.dart';
import 'package:task_manager/constants/colors.dart';

class TaskProgressCard extends StatelessWidget {
  final bool isCompleted;
  final String title;
  final String description;
  final String startTime;
  final String endTime;

  const TaskProgressCard({
    super.key,
    required this.isCompleted,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
          color: const Color(0xff272727),
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  color: isCompleted ? taskColors[0] : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                  border: isCompleted ? null : Border.all(color: Colors.white)),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey.shade300),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "$startTime to $endTime",
                  style: const TextStyle(color: Colors.white24),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
