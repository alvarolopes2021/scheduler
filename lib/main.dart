import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'constants/AppColors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scheduler',
      theme: ThemeData(
        primarySwatch: AppColors.appPrimarySwatch,
      ),
      home: StatefulHomePage(),
    );
  }
}
