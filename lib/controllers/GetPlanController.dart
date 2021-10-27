import 'package:http/http.dart' as http;
import 'package:scheduler/models/PlanModel.dart';

class GetPlanController{

  Future<dynamic> getPlan() async{
    print('**** GetPlan API ****');

    List<PlanModel> plansList = [];
    var url = Uri.parse('http://192.168.0.5:8080/plans');

    try{
      print('trying');
      var response = await http.get(url,
          headers: {'Content-type': 'application/json; charset=UTF-8', 'Accept': 'application/json',
            'Authorization': "application/json"}
      ).timeout(Duration(seconds: 10));
      if(response.statusCode == 200){
        //print('plans data: '+ response.body.toString());
        plansList = PlanModel().toList(response.body);
        return plansList;
      }
      else{
        return null;
      }
    }
    catch(e){
      print(e);
    }
  }

}