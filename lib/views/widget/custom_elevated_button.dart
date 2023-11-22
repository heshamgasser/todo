import 'package:flutter/material.dart';

import '../../shared/styles/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  String buttonText;
  Color buttonColor;
  Function buttonFunction;


  CustomElevatedButton(
      {required this.buttonText,required this.buttonColor,required this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor),
        onPressed: () {
         buttonFunction();
        },
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
