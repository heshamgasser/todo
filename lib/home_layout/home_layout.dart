import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/home_provider.dart';
import 'package:todo_app/shared/styles/app_color.dart';

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
            title: Text('To Do List', style: Theme.of(context).textTheme.titleLarge,),
          ),

          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.lightPrimaryColor,
            shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 3.r),),

            onPressed: () {

            },
            child: Icon(Icons.add, size: 30.r,),
          ),


          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r),),
            child: BottomAppBar(
              notchMargin: 15.r,

              child: BottomNavigationBar(
                currentIndex: homeProvider.selectedIndex,
                onTap: (value) {
                  homeProvider.changeSelectedIndex(value);
                },
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'Tasks'),
                  BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
                ],),
            ),
          ),

        );
      },

    );
  }
}
