import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/styles/app_color.dart';

class DatePickerContainerAddTask extends StatelessWidget {
  String dateText;
  Function selectDate;


  DatePickerContainerAddTask({required this.dateText,required this.selectDate});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        selectDate();
      },
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColor.lightPrimaryColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.date_range),
            SizedBox(width: 10.w),
            Text(
              dateText,

            ),
          ],
        ),
      ),
    );
  }
}
