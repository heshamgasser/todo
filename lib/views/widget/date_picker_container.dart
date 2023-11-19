import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';
import '../../shared/styles/app_color.dart';

class DateContainer extends StatelessWidget {
  Function backFunction;
  Function forwardFunction;
  Function selectDate;
  DateTime selectedDate;

  DateContainer(
      {required this.backFunction,
      required this.forwardFunction,
      required this.selectDate,
      required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            backFunction();
          },
          icon: CircleAvatar(
            backgroundColor: AppColor.lightPrimaryColor,
            radius: 25.r,
            child: Center(
              child: Icon(
                appProvider.languageCode == 'en'
                    ? Icons.keyboard_arrow_left
                    : Icons.keyboard_arrow_right,
                size: 30.r,
                color: Colors.white,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            selectDate();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: AppColor.lightPrimaryColor),
            ),
            child: Text(
              DateFormat('dd - MMMM - yyyy').format(selectedDate),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            forwardFunction();
          },
          icon: CircleAvatar(
            backgroundColor: AppColor.lightPrimaryColor,
            radius: 25.r,
            child: Center(
              child: Icon(
                appProvider.languageCode == 'en'
                    ? Icons.keyboard_arrow_right
                    : Icons.keyboard_arrow_left,
                size: 30.r,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
