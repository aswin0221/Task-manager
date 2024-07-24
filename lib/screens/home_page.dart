import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/components/date_slider.dart';
import 'package:task_manager/components/task_card.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/providers/task_providers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TaskProviders taskProviders = Provider.of(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text("Hello, Aswin",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text("Organize tasks,",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text("Boost productivity with us,",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(taskProviders.today,
                      style:  TextStyle(
                          color: taskColors[0],
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                ]),
                IconButton.outlined(
                    padding: const EdgeInsets.all(16),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          DateSlider(
            date: taskProviders.date,
          ),
          Expanded(
            child: ListView.builder(
              //shrinkWrap: true,
              itemCount: taskProviders.tasks.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  color: taskColors[index % taskColors.length],
                  task: taskProviders.tasks[index],
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
