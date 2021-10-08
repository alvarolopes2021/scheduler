import 'package:flutter/cupertino.dart';

class StatefulPlansPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PlansPage();
  }
}

class PlansPage extends State<StatefulPlansPage>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Planos')
        ],
      ),
    );
  }

}