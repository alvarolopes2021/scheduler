import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/constants/AppColors.dart';
import 'package:scheduler/services/servicesImpl/DoctorsByPlanIdImpl.dart';
import 'package:scheduler/services/servicesImpl/GetDoctorTimeByPlanIdAndDoctorIdImpl.dart';
import 'package:scheduler/utils/MainAppBar.dart';

class StatefulDoctorsTime extends StatefulWidget {
  final String? planId;
  final String? doctorId;
  StatefulDoctorsTime({ required this.planId, required this.doctorId });

  @override
  State<StatefulWidget> createState() {
    return DoctorsTimePage(planId: this.planId, doctorId: this.doctorId);
  }
}

class DoctorsTimePage extends State<StatefulDoctorsTime>{
  final String? planId;
  final String? doctorId;
  DoctorsTimePage({ required this.planId, required this.doctorId});

  StreamController<List<Widget>> doctorTimeController = StreamController<List<Widget>>.broadcast();

  @override
  void initState(){
    super.initState();
    GetDoctorTimeByPlanIdAndDoctorIdImpl().getDoctorTimeByPlanIdAndDoctorId(doctorTimeController, this.planId.toString(),
        this.doctorId.toString()
    );
  }

  @override
  void dispose(){
    this.doctorTimeController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar().build(context) as AppBar,
      body: StreamBuilder(
        stream: this.doctorTimeController.stream,
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<Widget> doctorsByPlanId = snapshot.data as List<Widget>;
            return ListView(
              children: doctorsByPlanId,
            );
          }
          else{
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.appPrimarySwatch,
              ),
            );
          }
        },
      ),
    );
  }

}
