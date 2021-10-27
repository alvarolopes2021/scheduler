import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduler/constants/AppColors.dart';
import 'package:scheduler/services/PlansServices.dart';
import 'package:scheduler/services/servicesImpl/PlanServicesImpl.dart';

class StatefulPlansPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PlansPage();
  }
}

class PlansPage extends State<StatefulPlansPage>{
  StreamController<List<Widget>> plansController = StreamController<List<Widget>>.broadcast();

  @override
  void initState(){
    super.initState();
    PlanServicesImpl().generatePlans(this.plansController);
  }

  @override
  void dispose(){
    this.plansController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        stream: this.plansController.stream,
        builder: (context, snapshot){
          if(snapshot.hasData){
            List<Widget> plans = snapshot.data as List<Widget>;
            return ListView(
              children: plans,
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
      )
    );
  }

}