import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/models/tasks_model.dart';

class TaskProviders extends ChangeNotifier {
  //Constructor.
  TaskProviders() {
    getAllTasks(DateTime.now());
    notifyListeners();
  }

  //Initializations.
  List<TasksModel> tasks = [];
  DateTime selectedDate = DateTime.now();
  String today = DateFormat("d, MMMM yyyy").format(DateTime.now());

  ///this setter will set the date to [selectedDate] and we will pass that date to getAllTask method
  ///to get the related tasks in that particular day.
  set date(DateTime date) {
    selectedDate = date;
    getAllTasks(selectedDate);
    notifyListeners();
  }

  ///this getter is used to get the current selected date.
  DateTime get date {
    return selectedDate;
  }

  //Sample data for tasks.
  List sampleTasks = [
    {
      "name": "Aswin",
      "workTitle": "Flutter Development",
      "workDescription":
          "Need to complete the flutter assignment tasks as soon as possible",
      "priority": "High Priority",
      "taskProgress": [
        {
          "title": "Task 1",
          "description":
              "Complete the UI as specified in the mail, following the Dribble design.",
          "isCompleted": true,
          "startTime": "06:00 AM",
          "endTime": "02:00 PM"
        },
        {
          "title": "Task 2",
          "description": "Design for Top started repositories in github.",
          "isCompleted": true,
          "startTime": "02:00 PM",
          "endTime": "06:00 PM"
        },
        {
          "title": "Task 3",
          "description":
              "Integrate the API for fetching the top stared repos in github.",
          "isCompleted": true,
          "startTime": "06:00 PM",
          "endTime": "09:00 PM"
        }
      ],
      "taskDate": DateTime.now()
    },
    {
      "name": "John",
      "workTitle": "Project Management",
      "workDescription": "Prepare the quarterly report for the project.",
      "priority": "Medium Priority",
      "taskProgress": [
        {
          "title": "Data Collection",
          "description":
              "Gather all relevant data from the project management tool.",
          "isCompleted": true,
          "startTime": "09:00 AM",
          "endTime": "11:00 AM"
        },
        {
          "title": "Data Analysis",
          "description":
              "Analyze the collected data to identify trends and insights.",
          "isCompleted": false,
          "startTime": "11:00 AM",
          "endTime": "01:00 PM"
        },
        {
          "title": "Report Writing",
          "description": "Draft the initial version of the quarterly report.",
          "isCompleted": false,
          "startTime": "02:00 PM",
          "endTime": "05:00 PM"
        },
        {
          "title": "Review and Edit",
          "description": "Review the report for accuracy and completeness.",
          "isCompleted": false,
          "startTime": "05:00 PM",
          "endTime": "06:00 PM"
        }
      ],
      "taskDate": DateTime.now()
    },
    {
      "name": "Mary",
      "workTitle": "Web Development",
      "workDescription": "Develop and deploy the new marketing website.",
      "priority": "High Priority",
      "taskProgress": [
        {
          "title": "Design Layout",
          "description": "Create a wireframe for the new website layout.",
          "isCompleted": true,
          "startTime": "08:00 AM",
          "endTime": "10:00 AM"
        },
        {
          "title": "Implement Layout",
          "description": "Convert the wireframe into actual HTML/CSS.",
          "isCompleted": false,
          "startTime": "10:00 AM",
          "endTime": "01:00 PM"
        },
        {
          "title": "Add Content",
          "description": "Populate the website with the necessary content.",
          "isCompleted": false,
          "startTime": "02:00 PM",
          "endTime": "05:00 PM"
        },
        {
          "title": "Testing",
          "description": "Test the website for any bugs or issues.",
          "isCompleted": false,
          "startTime": "05:00 PM",
          "endTime": "07:00 PM"
        }
      ],
      "taskDate": DateTime.now().subtract(const Duration(days: 1))
    },
    {
      "name": "Sam",
      "workTitle": "Client Relations",
      "workDescription": "Prepare for the upcoming client presentation.",
      "priority": "Low Priority",
      "taskProgress": [
        {
          "title": "Slide Creation",
          "description": "Create slides for the presentation using PowerPoint.",
          "isCompleted": true,
          "startTime": "10:00 AM",
          "endTime": "12:00 PM"
        },
        {
          "title": "Rehearse Presentation",
          "description": "Practice delivering the presentation.",
          "isCompleted": false,
          "startTime": "01:00 PM",
          "endTime": "03:00 PM"
        },
        {
          "title": "Client Meeting Preparation",
          "description":
              "Prepare any additional materials needed for the meeting.",
          "isCompleted": false,
          "startTime": "03:00 PM",
          "endTime": "05:00 PM"
        },
        {
          "title": "Final Review",
          "description": "Review all materials to ensure everything is ready.",
          "isCompleted": false,
          "startTime": "05:00 PM",
          "endTime": "06:00 PM"
        }
      ],
      "taskDate": DateTime.now()
    },
    {
      "name": "Lisa",
      "workTitle": "Code Review",
      "workDescription":
          "Conduct a code review for the latest project updates.",
      "priority": "Medium Priority",
      "taskProgress": [
        {
          "title": "Review Module A",
          "description": "Check the new updates in Module A for any issues.",
          "isCompleted": true,
          "startTime": "09:00 AM",
          "endTime": "11:00 AM"
        },
        {
          "title": "Review Module B",
          "description": "Check the new updates in Module B for any issues.",
          "isCompleted": false,
          "startTime": "11:00 AM",
          "endTime": "01:00 PM"
        },
        {
          "title": "Review Module C",
          "description": "Check the new updates in Module C for any issues.",
          "isCompleted": false,
          "startTime": "02:00 PM",
          "endTime": "04:00 PM"
        },
        {
          "title": "Final Review",
          "description": "Compile all findings and prepare a summary report.",
          "isCompleted": false,
          "startTime": "04:00 PM",
          "endTime": "05:00 PM"
        }
      ],
      "taskDate": DateTime.now().add(const Duration(days: 1))
    }
  ];

  ///This getAllTasks method will take DateTime and return the same date tasks from [sampleTasks], and
  ///add all the returned tasks to [tasks] list.
  getAllTasks(DateTime date) {
    tasks = [];
    notifyListeners();
    List selectedDayTasks = sampleTasks
        .where((element) => element["taskDate"].day == date.day)
        .toList();
    for (var i in selectedDayTasks) {
      tasks.add(TasksModel.fromMap(i));
    }
    notifyListeners();
  }
}
