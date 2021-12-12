import 'dart:convert';

import 'package:flutter/cupertino.dart';

class PlanModel{
  int? planId;
  String? planProvider;
  String? planType;
  double? planValue;

  PlanModel({
    this.planId,
    this.planProvider,
    this.planType,
    this.planValue
  });

  List<PlanModel> plansList(List<dynamic> plans){
    List<PlanModel> plansList = [];
    if(plans.isNotEmpty){
      for(int i=0; i < plans.length; i++){
        PlanModel object = PlanModel(
            planId: plans[i]['planId'],
            planProvider: plans[i]['planProvider'],
            planType: plans[i]['planType'],
            planValue: double.parse(plans[i]['planValue'].toString())
        );
        plansList.add(object);
      }
    }
    return plansList;
  }

  List<PlanModel> toList(String response){
    return plansList( jsonDecode(response) ) ;
  }

}