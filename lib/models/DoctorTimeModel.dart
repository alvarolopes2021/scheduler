import 'dart:convert';

import 'package:flutter/cupertino.dart';

class DoctorsTimeModel{
  int? doctorTimeId;
  String? doctorName;
  String? doctorExperience;
  String? planProvider;
  String? planType;
  String? doctorTime;


  DoctorsTimeModel({
    this.doctorTimeId,
    this.doctorName,
    this.doctorExperience,
    this.planProvider,
    this.planType,
    this.doctorTime
  });

  List<DoctorsTimeModel> doctorsList(List<dynamic> doctorsByPlanIdAndDoctorId){
    List<DoctorsTimeModel> doctorsByPlanAndDoctorIdList = [];
    if(doctorsByPlanIdAndDoctorId.isNotEmpty){
      for(int i=0; i < doctorsByPlanIdAndDoctorId.length; i++){
        DoctorsTimeModel object = DoctorsTimeModel(
          doctorTimeId: doctorsByPlanIdAndDoctorId[i]['doctorTimeId'],
          doctorName: doctorsByPlanIdAndDoctorId[i]['doctorName'],
          doctorExperience: doctorsByPlanIdAndDoctorId[i]['doctorExperience'],
          planProvider: doctorsByPlanIdAndDoctorId[i]['planProvider'],
          planType: doctorsByPlanIdAndDoctorId[i]['planType'],
          doctorTime: doctorsByPlanIdAndDoctorId[i]['doctorTime'],
        );
        doctorsByPlanAndDoctorIdList.add(object);
      }
    }
    return doctorsByPlanAndDoctorIdList;
  }

  List<DoctorsTimeModel> toList(String response){
    return doctorsList( jsonDecode(response) ) ;
  }

}