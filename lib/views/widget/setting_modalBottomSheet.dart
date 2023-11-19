import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/shared/styles/app_color.dart';

import '../../provider/app_provider.dart';

class SettingModalBottomSheet extends StatelessWidget {
  String title;
  String optionOne;
  String optionTwo;
  bool selected;
  Function optionOneFunction;
  Function optionTwoFunction;

  SettingModalBottomSheet({
    required this.title,
    required this.optionOne,
    required this.optionTwo,
    required this.selected,
    required this.optionOneFunction,
    required this.optionTwoFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).textTheme.displayMedium
                : Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.white),
          ),
          SizedBox(height: 20.h),
          InkWell(
            onTap: () {
              optionOneFunction();
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  optionOne,
                  style: selected
                      ? Theme.of(context).textTheme.displaySmall
                      : Theme.of(context).textTheme.displaySmall!.copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white),
                ),
                Spacer(),
                Visibility(
                    visible: selected,
                    child: Icon(
                      Icons.done,
                      size: 30.r,
                      color: AppColor.lightPrimaryColor,
                    )),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          InkWell(
            onTap: () {
              optionTwoFunction();
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  optionTwo,
                  style: !selected
                      ? Theme.of(context).textTheme.displaySmall
                      : Theme.of(context).textTheme.displaySmall!.copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white),
                ),
                Spacer(),
                Visibility(
                    visible: !selected,
                    child: Icon(
                      Icons.done,
                      size: 30.r,
                      color: AppColor.lightPrimaryColor,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
