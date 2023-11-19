import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/shared/styles/app_color.dart';
import 'package:todo_app/shared/styles/app_text.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      toolbarHeight: 200.h,
      color: AppColor.lightPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
    ),

    scaffoldBackgroundColor: AppColor.lightGreenColor,

    textTheme: TextTheme(
      titleLarge: AppText.titleLarge,
    ),


  );

  static ThemeData darkTheme = ThemeData();
}
