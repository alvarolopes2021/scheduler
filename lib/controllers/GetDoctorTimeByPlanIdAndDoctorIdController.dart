import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:scheduler/constants/SystemConstants.dart';

class GetDoctorTimeByPlanIdAndDoctorIdController{

  Future<dynamic> getDoctorTimeByPlanIdAndDoctorId(String planId, String doctorId) async{

    var dio = Dio();
    print('**** getDoctorTimeByPlanIdAndDoctorId API ****');

    String endpoint = 'http://192.168.15.13:8080/' + HttpEndpoints.DOCTORS_TIME_BY_PLAN_ID_AND_DOCTORS_ID;

    Map<String, String> criteria = {"planId": planId.replaceAll("[", "").replaceAll("<", "").replaceAll("'", ""),
      "doctorId": doctorId.replaceAll("]", "").replaceAll(">", "").replaceAll("'", "")};

    var response = await dio.get(endpoint, queryParameters: criteria, options: Options(
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