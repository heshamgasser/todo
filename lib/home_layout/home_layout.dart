import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/home_provider.dart';
import 'package:todo_app/shared/styles/app_color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/views/add_task.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'Home Layout';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        var homeProvider = Provider.of<HomeProvider>(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.todoList,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.lightPrimaryColor,
            shape: StadiumBorder(
              side: BorderSide(color: Colors.white, width: 3.r),
            ),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                isDismissible: false,
                backgroundColor:
                    Theme.of(context).brightness == Brightness.light
                        ? AppColor.lightGreenColor
                        : AppColor.darkBlackColor,
                context: context,
                builder: (context) {
                  return AddTask();
                },
              );
            },
            child: Icon(
              Icons.add,
              size: 30.r,
              color: Colors.white,
            ),
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r),
              topLeft: Radius.circular(20.r),
            ),
            child: BottomAppBar(
              notchMargin: 15.r,
              child: BottomNavigationBar(
                currentIndex: homeProvider.selectedIndex,
                onTap: (value) {
                  homeProvider.changeSelectedIndex(value);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu),
                      label: AppLocalizations.of(context)!.tasks),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: AppLocalizations.of(context)!.settings),
                ],
              ),
            ),
          ),
          body: homeProvider.tabs[homeProvider.selectedIndex],
        );
      },
    );
  }
}
