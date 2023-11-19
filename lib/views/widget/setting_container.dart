import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/views/widget/setting_modalBottomSheet.dart';

import '../../provider/app_provider.dart';
import '../../shared/styles/app_color.dart';

class SettingContainer extends StatelessWidget {
  String containterText;

  Widget widget;

  SettingContainer({required this.containterText, required this.widget});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? AppColor.lightGreenColor
              : AppColor.darkBlackColor,
          context: context,
          builder: (context) {
            return widget;
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColor.lightPrimaryColor),
        ),
        child: Row(
          children: [
            Text(
              containterText,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Spacer(),
            Icon(
              Icons.arrow_drop_down,
              size: 30.r,
              color: AppColor.lightPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
