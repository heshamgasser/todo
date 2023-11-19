import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/shared/styles/app_color.dart';

class AppText {

 static TextStyle titleLarge = GoogleFonts.poppins(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white
  );
 static TextStyle titleMedium = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.lightPrimaryColor
  );



 static TextStyle displayMedium = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black
  );
 static TextStyle displaySmall = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.lightPrimaryColor
  );

 static TextStyle labelLarge = GoogleFonts.poppins(
     fontSize: 18.sp,
     fontWeight: FontWeight.bold,
     color: AppColor.lightPrimaryColor
 );
 static TextStyle labelMedium = GoogleFonts.poppins(
     fontSize: 14.sp,
     fontWeight: FontWeight.bold,
     color: Colors.black
 );
 static TextStyle labelSmall = GoogleFonts.poppins(
     fontSize: 12.sp,
     fontWeight: FontWeight.normal,
     color: Colors.black
 );

}