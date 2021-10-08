
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/pages/PlansPage.dart';

import 'constants/SystemConstants.dart';

class StatefulHomePage extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<StatefulHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Image(image: AssetImage('assets/images/appointment_icon.png'),),
        title: Text(SystemConstants.appName),
      ),
      body: StatefulPlansPage()
    );
  }
}