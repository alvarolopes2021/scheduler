import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/constants/SystemConstants.dart';

class MainAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image(image: AssetImage('assets/images/appointment_icon.png'),),
      title: Text(SystemConstants.appName),
    );
  }

}