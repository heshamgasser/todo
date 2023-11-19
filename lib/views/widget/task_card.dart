import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/styles/app_color.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      elevation: 5.w,
      child: Container(
        height: 115.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : AppColor.darkTaskColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Row(
            children: [
              VerticalDivider(
                thickness: 3.r,
                color: AppColor.lightPrimaryColor,
                indent: 17.h,
                endIndent: 17.h,
              ),
              SizedBox(width: 25.w),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 17.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Play Basket Ball',
                      style: Theme.of(context).textTheme.labelLarge,
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
                          '10:30 PM',
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
                    color: AppColor.lightPrimaryColor),
                child: Icon(
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
