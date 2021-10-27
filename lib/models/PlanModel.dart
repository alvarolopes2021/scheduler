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

  List<PlanModel> plansList(Map<String, dynamic> plans){
    List<PlanModel> plansList = [];
    if(plans.isNotEmpty){
      for(int i=0; i < plans.length; i++){
        PlanModel object = PlanModel(
            planId: plans['planId'],
            planProvider: plans['planProvider'],
            planType: plans['planType'],
            planValue: plans['planValue']
        );
        plansList.add(object);
      }
    }
    return plansList;
  }

  List<PlanModel> toList(String response){
    return plansList( json.decode(response) ) ;
  }

}