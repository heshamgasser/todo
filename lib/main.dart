import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home_layout/home_layout.dart';
import 'package:todo_app/provider/app_provider.dart';
import 'package:todo_app/shared/styles/app_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      builder: (context, child) {
        return Todo();
      },
    ),
  );
}

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {

    var appProvider = Provider.of<AppProvider>(context);
      appProvider.getSavedSettings();
    return ScreenUtilInit(
      designSize: Size(412, 870),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: HomeLayout.routeName,
          routes: {
            HomeLayout.routeName: (context) => HomeLayout(),
          },
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: appProvider.themeMode,
        );
      },
    );
  }
}
