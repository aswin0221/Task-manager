import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:task_manager/providers/task_providers.dart';

class DateSlider extends StatefulWidget {
  final DateTime date;
  const DateSlider({super.key, required this.date});

  @override
  State<DateSlider> createState() => _DateSliderState();
}

class _DateSliderState extends State<DateSlider> {

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToInitialDate();
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _scrollToInitialDate() {
    double initialOffset = (widget.date.day - 1) * 71;
    scrollController.jumpTo(initialOffset);
  }

  int _daysInMonth(DateTime date) {
    int year = date.year;
    int month = date.month;
    return DateTime(year, month + 1, 0).day;
  }

  @override
  Widget build(BuildContext context) {
    TaskProviders taskProviders = Provider.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 60,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
          border:
              Border.symmetric(horizontal: BorderSide(color: Colors.white38))),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        controller:scrollController,
        itemCount: _daysInMonth(DateTime.now()),
        separatorBuilder: (context, index) {
          return const Icon(
            Icons.circle,
            color: Colors.white38,
            size: 8,
          );
        },
        itemBuilder: (context, index) {
          return MaterialButton(
            minWidth: 70,
            onPressed: () {
              taskProviders.date= DateTime(DateTime.now().year,DateTime.now().month,index+1);
            },
            child: Text(
              "${index + 1}",
              style:  TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: index+1 == widget.date.day ? 24 : 16,
                  color: index+1 == widget.date.day ?  taskColors[0] : Colors.white38
              ),
            ),
          );
        },
      ),
    );
  }
}
