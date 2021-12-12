import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'constants/AppColors.dart';
import 'constants/SystemConstants.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: SystemConstants.appName,
      theme: ThemeData(
        primarySwatch: AppColors.appPrimarySwatch,
      ),
      home: StatefulHomePage(),
    );
  }
}
