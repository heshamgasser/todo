import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home_layout/home_layout.dart';
import 'package:todo_app/provider/app_provider.dart';
import 'package:todo_app/shared/styles/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

          localizationsDelegates: [
            AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'), // English
            Locale('ar'), // Arabic
          ],
          
          locale: Locale(appProvider.languageCode),

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
