import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/shared/styles/app_color.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            Text('Settings', style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center,),

          SizedBox(height: 20.h),
          Text('Language', style: Theme.of(context).textTheme.displayMedium,),
          SizedBox(height: 15.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: AppColor.lightPrimaryColor),
            ),
            child: Text('English', style: Theme.of(context).textTheme.displaySmall,),
          ),
        ],
      ),
    );
  }
}
