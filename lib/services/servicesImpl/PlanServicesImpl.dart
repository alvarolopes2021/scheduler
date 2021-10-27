import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:scheduler/controllers/GetPlanController.dart';
import 'package:scheduler/models/PlanModel.dart';
import 'package:scheduler/services/PlansServices.dart';

class PlanServicesImpl extends PlansServices{

  @override
  Future<List<Widget>> generatePlans(StreamController<List<Widget>> plansController) async {
    List<Widget> children = [];
    List<PlanModel> plansList = [];
    var response = await GetPlanController().getPlan();
    if(response != null){
       plansList = PlanModel().toList(response);
       for(int i = 0; i< plansList.length; i++){
         children.add(
             ListTile(
               key: Key(plansList[i].planId.toString()),
               title: Text(plansList[i].planProvider.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
               subtitle: Text(plansList[i].planType.toString()),
               tileColor: i % 2 == 0 ? Colors.white30 : Colors.blue.shade100,
             )
         );
       }
    }
    plansController.add(children);
    return children;
  }
}