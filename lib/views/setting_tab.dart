import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/app_provider.dart';
import 'package:todo_app/provider/home_provider.dart';
import 'package:todo_app/shared/styles/app_color.dart';
import 'package:todo_app/views/widget/setting_container.dart';
import 'package:todo_app/views/widget/setting_modalBottomSheet.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Settings',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          Text(
            'Language',
            style: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).textTheme.displayMedium
                : Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 15.h,
          ),
          SettingContainer(
            containterText: 'English',
            widget: SettingModalBottomSheet(
              title: 'Language',
              optionOne: 'English',
              optionTwo: 'Arabic',
              selected: appProvider.languageCode == 'en' ? true : false,
              optionOneFunction: () {
                appProvider.changeLanguageCode('en');
              },
              optionTwoFunction: () {
                appProvider.changeLanguageCode('ar');
              },
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Theme Mode',
            style: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).textTheme.displayMedium
                : Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 15.h,
          ),
          SettingContainer(
            containterText: 'Light Theme',
            widget: SettingModalBottomSheet(
              title: 'Theme Mode',
              optionOne: 'Light Theme',
              optionTwo: 'Dark Theme',
              selected: Theme.of(context).brightness == Brightness.light ? true : false,
              optionOneFunction: () {
                appProvider.changeThemeMode(ThemeMode.light);
              },
              optionTwoFunction: () {
                appProvider.changeThemeMode(ThemeMode.dark);
              },
            ),
          ),
        ],
      ),
    );
  }
}
