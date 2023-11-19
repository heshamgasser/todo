import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'Home Layout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List', style: Theme.of(context).textTheme.titleLarge,),
      ),
    );
  }
}
