import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class GetDoctorTimeByPlanIdAndDoctorIdService{
  Future<List<Widget>> getDoctorTimeByPlanIdAndDoctorId(StreamController<List<Widget>> doctorTimeController, String planId, String doctorId);
}