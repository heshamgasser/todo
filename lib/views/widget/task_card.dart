import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/models/one_task_model.dart';

import '../../shared/styles/app_color.dart';

class TaskCard extends StatelessWidget {
  OneTaskModel taskModel;
  Function deleteFunction;
  Function doneFunction;

  TaskCard({required this.taskModel, required this.deleteFunction, required this.doneFunction});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              deleteFunction();
            },
            backgroundColor: Color(0xFFFE4A49),
            borderRadius: BorderRadius.circular(20.r),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              doneFunction();
            },
            backgroundColor: Color(0xFF7BC043),
            borderRadius: BorderRadius.circular(20.r),
            foregroundColor: Colors.white,
            icon: Icons.done,
            label: 'Done',
          ),
        ],
      ),






      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        elevation: 5.r,
        child: Container(
          height: 150.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : AppColor.darkTaskColor,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Row(
              children: [
                VerticalDivider(
                  thickness: 3.r,
                  color: taskModel.status
                      ? AppColor.greenColor
                      : AppColor.lightPrimaryColor,
                  indent: 17.h,
                  endIndent: 17.h,
                ),
                SizedBox(width: 10.w),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 17.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskModel.title,
                        style: taskModel.status
                            ? Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: AppColor.greenColor)
                            : Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          taskModel.details,
                          style: Theme.of(context).textTheme.displayMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.clock,
                            size: 20.r,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            taskModel.time,
                            style: Theme.of(context).textTheme.labelSmall,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  width: 69.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: taskModel.status
                          ? AppColor.greenColor
                          : AppColor.lightPrimaryColor),
                  child: taskModel.status
                      ? Center(
                          child: Text(
                            'Done!',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        )
                      : Icon(
                          Icons.done,
                          size: 30.r,
                          color: Colors.white,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
