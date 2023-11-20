import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/one_task_model.dart';
import 'package:todo_app/provider/tasks_provider.dart';
import 'package:todo_app/shared/remote/firebase_function.dart';
import 'package:todo_app/views/widget/date_picker_container.dart';
import 'package:todo_app/views/widget/task_card.dart';

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
              SizedBox(height: 20.h),
              StreamBuilder(stream: FireBaseFunction.getTaskFromFireStore(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Text('Something Went Wrong', style: Theme
                        .of(context)
                        .textTheme
                        .displayMedium,);
                  }

                  if (!snapshot.hasData){
                    return Text('There is No Tasks', style: Theme
                        .of(context)
                        .textTheme
                        .displayMedium,);
                  }

                  List<OneTaskModel> tasks = snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

                  return   tasks.isEmpty ? Text('There is No Tasks', style: Theme
                      .of(context)
                      .textTheme
                      .displayMedium,) :

                    Expanded(
                    child: ListView.separated(itemBuilder: (context, index) {
                      return TaskCard(tasks[index]);
                    }, separatorBuilder: (context, index) {
                      return SizedBox(height: 10.h);
                    }, itemCount: tasks.length),
                  );

                },)


            ],
          ),
        );
      },
    );
  }
}
