import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class GetPlanController{

  Future<dynamic> getPlan() async{
    print('**** GetPlan API ****');
    var dio = Dio();
    var url = 'http://192.168.0.5:8080/plans';

    try{
      print('trying');
      var response = await dio.get(url,
          options: Options(
              headers: {'Content-type': 'application/json; charset=UTF-8', 'Accept': 'application/json',},
              receiveTimeout: 10000
          )
      );
      if(response.statusCode == 200){
        print('plans data: '+ response.data.toString());
        return response.data;
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