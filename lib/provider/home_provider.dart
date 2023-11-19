import 'package:flutter/material.dart';
import 'package:todo_app/views/setting_tab.dart';
import 'package:todo_app/views/task_tab.dart';

class HomeProvider extends ChangeNotifier {
  int selectedIndex = 0;
  GlobalKey<FormState> formKey = GlobalKey();

  void changeSelectedIndex(int value) {
    selectedIndex = value;
    notifyListeners();
  }

  List<Widget> tabs = [TasksTab(), SettingTab()];

  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDetailController = TextEditingController();

  DateTime selectedDate = DateUtils.dateOnly(DateTime.now());

  void changeSelectedDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      keyboardType: TextInputType.datetime,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      firstDate: selectedDate,
      lastDate: selectedDate.add(
        Duration(days: 365 * 2),
      ),
    );
    if (pickedDate != null &&
        pickedDate != selectedDate &&
        pickedDate.isAfter(selectedDate)) {
      selectedDate = pickedDate;
    }
    notifyListeners();
  }

  void goToNextDay() {
    selectedDate = selectedDate.add(
      Duration(days: 1),
    );

    notifyListeners();
  }

  void backToPreviousDay() {
    selectedDate = selectedDate.subtract(
      Duration(days: 1),
    );
    notifyListeners();
  }

  TimeOfDay time = TimeOfDay.now();

  void selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
        barrierColor: Colors.transparent, context: context, initialTime: time);

    if (pickedTime != null && pickedTime != time) {
      time = pickedTime;
    }
    notifyListeners();
  }
}
