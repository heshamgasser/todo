import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/app_provider.dart';
import 'package:todo_app/provider/tasks_provider.dart';
import 'package:todo_app/shared/styles/app_color.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksProvider(),
      builder: (context, child) {
        var tasksProvider = Provider.of<TasksProvider>(context);
        var appProvider = Provider.of<AppProvider>(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      tasksProvider.backToPreviousDay();
                    },
                    icon: CircleAvatar(
                      backgroundColor: AppColor.lightPrimaryColor,
                      radius: 25.r,
                      child: Center(
                        child: Icon(
                          appProvider.languageCode == 'en' ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
                          size: 30.r,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                     tasksProvider.changeSelectedDate(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 15.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: AppColor.lightPrimaryColor),
                      ),
                      child: Text(
                        DateFormat('dd - MMMM - yyyy')
                            .format(tasksProvider.selectedDate),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      tasksProvider.goToNextDay();
                    },
                    icon: CircleAvatar(
                      backgroundColor: AppColor.lightPrimaryColor,
                      radius: 25.r,
                      child: Center(
                        child: Icon(
                          appProvider.languageCode == 'en' ?  Icons.keyboard_arrow_right : Icons.keyboard_arrow_left,
                          size: 30.r,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
