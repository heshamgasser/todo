import 'package:flutter/material.dart';
import 'package:todo_app/views/setting_tab.dart';
import 'package:todo_app/views/task_tab.dart';

class HomeProvider extends ChangeNotifier{

  int selectedIndex = 0;

  void changeSelectedIndex (int value){
    selectedIndex = value;
    notifyListeners();
  }


  List<Widget> tabs = [TasksTab(), SettingTab()];


}