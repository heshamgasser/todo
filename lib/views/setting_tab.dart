import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/app_provider.dart';
import 'package:todo_app/views/widget/setting_container.dart';
import 'package:todo_app/views/widget/setting_modalBottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            AppLocalizations.of(context)!.settings,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.displayMedium
          ),
          SizedBox(
            height: 15.h,
          ),
          SettingContainer(
            containterText: appProvider.languageCode == 'en'
                ? AppLocalizations.of(context)!.english
                : AppLocalizations.of(context)!.arabic,
            widget: SettingModalBottomSheet(
              title: AppLocalizations.of(context)!.language,
              optionOne: AppLocalizations.of(context)!.english,
              optionTwo: AppLocalizations.of(context)!.arabic,
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
            AppLocalizations.of(context)!.themeMode,
            style: Theme.of(context).textTheme.displayMedium
          ),
          SizedBox(
            height: 15.h,
          ),
          SettingContainer(
            containterText: appProvider.themeMode == ThemeMode.light
                ? AppLocalizations.of(context)!.lightTheme
                : AppLocalizations.of(context)!.darkTheme,
            widget: SettingModalBottomSheet(
              title: AppLocalizations.of(context)!.themeMode,
              optionOne: AppLocalizations.of(context)!.lightTheme,
              optionTwo: AppLocalizations.of(context)!.darkTheme,
              selected: Theme.of(context).brightness == Brightness.light
                  ? true
                  : false,
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
