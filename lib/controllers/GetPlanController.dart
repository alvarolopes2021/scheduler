import 'package:http/http.dart' as http;
import 'package:scheduler/constants/SystemConstants.dart';

class GetPlanController{

  Future<dynamic> getPlan() async{
    print('**** GetPlan API ****');
    
    var url = Uri.parse('http://192.168.15.13:8080/' + HttpEndpoints.PLANS_ENDPOINT);

    try{
      var response = await http.get(url,
          headers: {'Content-type': 'application/json; charset=UTF-8', 'Accept': 'application/json',  'Authorization': "application/json"}
      ).timeout(Duration(seconds: 60));
      if(response.statusCode == 200){
        
        return response.body;
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