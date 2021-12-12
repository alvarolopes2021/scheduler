import 'dart:convert';

import 'package:flutter/cupertino.dart';

class DoctorsModel{
  int? doctorsByPlanId;
  int? doctorId;
  int? planId;
  String? crm;
  String? doctorName;
  String? doctorExperience;
  int? doctorRate;


  DoctorsModel({
    this.doctorsByPlanId,
    this.doctorId,
    this.planId,
    this.crm,
    this.doctorName,
    this.doctorExperience,
    this.doctorRate
  });

  List<DoctorsModel> doctorsList(List<dynamic> doctorsByPlanId){
    List<DoctorsModel> doctorsByPlanList = [];
    if(doctorsByPlanId.isNotEmpty){
      for(int i=0; i < doctorsByPlanId.length; i++){
        DoctorsModel object = DoctorsModel(
            doctorsByPlanId: doctorsByPlanId[i]['doctorsByPlanId'],
            doctorId: doctorsByPlanId[i]['doctorId'],
            planId: doctorsByPlanId[i]['planId'],
            crm: doctorsByPlanId[i]['crm'],
            doctorName: doctorsByPlanId[i]['doctorName'],
            doctorExperience: doctorsByPlanId[i]['doctorExperience'],
            doctorRate: doctorsByPlanId[i]['doctorRate'],
        );
        doctorsByPlanList.add(object);
      }
    }
    return doctorsByPlanList;
  }

  List<DoctorsModel> toList(String response){
    return doctorsList( jsonDecode(response) ) ;
  }

}