import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/shared/styles/app_color.dart';
import 'package:todo_app/shared/styles/app_text.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      toolbarHeight: 100.h,
      centerTitle: true,
      color: AppColor.lightPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
    ),

    scaffoldBackgroundColor: AppColor.lightGreenColor,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,

    textTheme: TextTheme(
      titleLarge: AppText.titleLarge,
      titleMedium: AppText.titleMedium,


      displayMedium: AppText.displayMedium,
      displaySmall: AppText.displaySmall,

      labelLarge: AppText.labelLarge,
      labelMedium: AppText.labelMedium,
      labelSmall: AppText.labelSmall
    ),

    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.white,
      height: 100.h,
      shape: CircularNotchedRectangle(),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(size: 30.r),
      unselectedIconTheme: IconThemeData(size: 30.r),
      backgroundColor: Colors.transparent,
      selectedItemColor: AppColor.lightPrimaryColor,
      unselectedItemColor: AppColor.grayColor,
      elevation: 0.0,

    ),

  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      toolbarHeight: 100.h,
      centerTitle: true,
      color: AppColor.lightPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
    ),

    scaffoldBackgroundColor: AppColor.darkBlackColor,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,

    textTheme: TextTheme(
      titleLarge: AppText.titleLarge,
      titleMedium: AppText.titleMedium,


      displayMedium: AppText.displayMedium,
      displaySmall: AppText.displaySmall,

        labelLarge: AppText.labelLarge,
        labelMedium: AppText.labelMedium.copyWith(color: Colors.white),
        labelSmall: AppText.labelSmall.copyWith(color: Colors.white)
    ),

    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColor.darkBlackColor,
      height: 100.h,
      shape: CircularNotchedRectangle(),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(size: 30.r),
      unselectedIconTheme: IconThemeData(size: 30.r),
      backgroundColor: Colors.transparent,
      selectedItemColor: AppColor.lightPrimaryColor,
      unselectedItemColor: AppColor.grayColor,
      elevation: 0.0,

    ),
  );
}
