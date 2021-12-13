import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scheduler/controllers/GetDoctorTimeByPlanIdAndDoctorIdController.dart';
import 'package:scheduler/models/DoctorTimeModel.dart';
import 'package:scheduler/models/DoctorsModel.dart';

import '../GetDoctorTimeByPlanIdAndDoctorIdService.dart';

class GetDoctorTimeByPlanIdAndDoctorIdImpl extends GetDoctorTimeByPlanIdAndDoctorIdService{
  @override
  Future<List<Widget>> getDoctorTimeByPlanIdAndDoctorId(StreamController<List<Widget>> doctorTimeController, String planId, String doctorId) async {
    List<Widget> children = [];
    List<DoctorsTimeModel> doctorsByPlanIdAndDoctorIdList = [];
    var response = await GetDoctorTimeByPlanIdAndDoctorIdController().getDoctorTimeByPlanIdAndDoctorId(planId, doctorId);
    if (response != null) {
      doctorsByPlanIdAndDoctorIdList = DoctorsTimeModel().doctorsList(response);
      for (int i = 0; i < doctorsByPlanIdAndDoctorIdList.length; i++) {
        children.add(
            ListTile(
              key: Key(doctorsByPlanIdAndDoctorIdList[i].doctorTimeId.toString()),
              title: Text(doctorsByPlanIdAndDoctorIdList[i].doctorName.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                  doctorsByPlanIdAndDoctorIdList[i].doctorExperience.toString()),

              trailing: Text(doctorsByPlanIdAndDoctorIdList[i].doctorTime.toString()),
              tileColor: i % 2 == 0 ? Colors.white30 : Colors.blue.shade100,
            )
        );
      }
    }
    doctorTimeController.add(children);
    return children;
  }

  Future<DoctorsTimeModel> testDoctorTime(String planId, String doctorId) async{
    List<DoctorsTimeModel> doctorTimes = [];
    var response = await GetDoctorTimeByPlanIdAndDoctorIdController().getDoctorTimeByPlanIdAndDoctorId(planId, doctorId);
    if(response != null){
      doctorTimes = DoctorsTimeModel().doctorsList(response);
    }
    return doctorTimes[0];
  }

}