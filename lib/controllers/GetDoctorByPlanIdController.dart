import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:scheduler/constants/SystemConstants.dart';

class GetDoctorByPlanIdController{

  Future<dynamic> getDoctorByPlanId(String planId) async{

    var dio = Dio();
    print('**** GetDoctorByPlanId API ****');

    String endpoint = 'http://192.168.15.13:8080/' + HttpEndpoints.DOCTORS_BY_PLAN_ID_ENDPOINT;

    var response = await dio.get(endpoint, queryParameters: {"planId": planId}, options: Options(
        headers: {'Content-type': 'application/json; charset=UTF-8', 'Accept': 'application/json'})
    );
    if(response.statusCode == 200){
      //print(response.data);
      return response.data;
    }
    else{
      return null;
    }
  }
}