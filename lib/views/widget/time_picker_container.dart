import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/styles/app_color.dart';

class TimePickerContainer extends StatelessWidget {
  String timeText;
  Function selectTime;


  TimePickerContainer({required this.timeText,required this.selectTime});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        selectTime();
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
            Icon(CupertinoIcons.clock),
            SizedBox(width: 10.w),
            Text(
              timeText,

            ),
          ],
        ),
      ),
    );
  }
}
