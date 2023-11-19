import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/app_provider.dart';
import 'package:todo_app/provider/tasks_provider.dart';
import 'package:todo_app/shared/styles/app_color.dart';
import 'package:todo_app/views/widget/date_picker_container.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksProvider(),
      builder: (context, child) {
        var tasksProvider = Provider.of<TasksProvider>(context);
        // var appProvider = Provider.of<AppProvider>(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              DateContainer(
                  backFunction: () {
                    tasksProvider.backToPreviousDay();
                  },
                  forwardFunction: () {
                    tasksProvider.goToNextDay();
                  },
                  selectDate: () {
                    tasksProvider.changeSelectedDate(context);
                  },
                  selectedDate: tasksProvider.selectedDate),
            ],
          ),
        );
      },
    );
  }
}
