import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scheduler/controllers/GetDoctorByPlanIdController.dart';

import 'package:scheduler/models/DoctorsModel.dart';

import '../DoctorByPlanIdService.dart';

class DoctorsByPlanIdImpl extends DoctorsByPlanIdService{

  @override
  Future<List<Widget>> generateDoctorsByPlanId(StreamController<List<Widget>> doctorsByPlanIdController, String planId) async {
    List<Widget> children = [];
    List<DoctorsModel> doctorsByPlanIdList = [];
    var response = await GetDoctorByPlanIdController().getDoctorByPlanId(planId);
    if(response != null){
      doctorsByPlanIdList = DoctorsModel().doctorsList(response);
      for(int i = 0; i< doctorsByPlanIdList.length; i++){
        children.add(
            ListTile(
              key: Key(doctorsByPlanIdList[i].planId.toString()),
              title: Text(doctorsByPlanIdList[i].doctorName.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(doctorsByPlanIdList[i].doctorExperience.toString()),
              tileColor: i % 2 == 0 ? Colors.white30 : Colors.blue.shade100,
            )
        );
      }
    }
    doctorsByPlanIdController.add(children);
    return children;
  }

  Future<List<DoctorsModel>> testDoctorsModel(int planId) async{
    List<DoctorsModel> doctorsByPlanIdList = [];
    var response = await GetDoctorByPlanIdController().getDoctorByPlanId(planId);
    if(response != null){
      doctorsByPlanIdList = DoctorsModel().doctorsList(response);
    }
    return doctorsByPlanIdList;
  }

}