
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/pages/PlansPage.dart';
import 'package:scheduler/utils/MainAppBar.dart';

import 'constants/SystemConstants.dart';

class StatefulHomePage extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<StatefulHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MainAppBar().build(context) as AppBar,
      body: StatefulPlansPage()
    );
  }
}