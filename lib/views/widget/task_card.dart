import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/models/one_task_model.dart';

import '../../shared/styles/app_color.dart';

class TaskCard extends StatelessWidget {
  OneTaskModel taskModel;


  TaskCard(this.taskModel);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                color: AppColor.lightPrimaryColor,
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
                      style: Theme.of(context).textTheme.labelLarge,
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
                    color: taskModel.status ? AppColor.greenColor : AppColor.lightPrimaryColor),
                child: taskModel.status ? Center(child: Text('Done!', style: Theme.of(context).textTheme.titleSmall,)) : Icon(
                  Icons.done,
                  size: 30.r,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
