import 'package:flutter/material.dart';

class TasksProvider extends ChangeNotifier {
  DateTime selectedDate = DateUtils.dateOnly(DateTime.now());

  void changeSelectedDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      keyboardType: TextInputType.datetime,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      firstDate: selectedDate.subtract(
        Duration(days: 365),
      ),
      lastDate: selectedDate.add(
        Duration(days: 365 * 2),
      ),
    );
    if (pickedDate != null && pickedDate != selectedDate){
      selectedDate = pickedDate;
    }
    notifyListeners();
  }

  void goToNextDay (){
    selectedDate =  selectedDate.add(Duration(days: 1),);

    notifyListeners();
  }

  void backToPreviousDay (){
   selectedDate =  selectedDate.subtract(Duration(days: 1),);
    notifyListeners();
  }

}
