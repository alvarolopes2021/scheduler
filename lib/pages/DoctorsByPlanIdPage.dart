import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/constants/AppColors.dart';
import 'package:scheduler/services/servicesImpl/DoctorsByPlanIdImpl.dart';
import 'package:scheduler/utils/MainAppBar.dart';

import 'DoctorTimePage.dart';

class StatefulDoctorsByPlanId extends StatefulWidget {
  final Key? planKey;
  StatefulDoctorsByPlanId({ required this.planKey });

  @override
  State<StatefulWidget> createState() {
    return DoctorsByPlanIdPage(planKey: this.planKey);
  }
}

class DoctorsByPlanIdPage extends State<StatefulDoctorsByPlanId>{
  final Key? planKey;
  DoctorsByPlanIdPage({ required this.planKey});

  StreamController<List<Widget>> doctorsByPlanIdController = StreamController<List<Widget>>.broadcast();

  @override
  void initState(){
    super.initState();
    var planId = this.planKey.toString().replaceAll('[', '').replaceAll('<', '').replaceAll("'", "").replaceAll('>', '').replaceAll(']', '');
    DoctorsByPlanIdImpl().generateDoctorsByPlanId(doctorsByPlanIdController, planId);
  }

  @override
  void dispose(){
    this.doctorsByPlanIdController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar().build(context) as AppBar,
      body: StreamBuilder(
        stream: this.doctorsByPlanIdController.stream,
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<Widget> doctorsByPlanId = snapshot.data as List<Widget>;
            return ListView.builder(
              itemCount: doctorsByPlanId.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  child: doctorsByPlanId[index],
                  onTap: (){
                    List<String> keys = doctorsByPlanId[index].key.toString().split(";");
                    Map<String,String> criteria = {"planId": keys[0], "doctorId": keys[1]};
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        StatefulDoctorsTime(planId: criteria["planId"], doctorId: criteria["doctorId"])
                    ));
                  },
                );
              },
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
