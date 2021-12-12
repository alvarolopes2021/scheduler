import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class DoctorsByPlanIdService{
  Future<List<Widget>> generateDoctorsByPlanId(StreamController<List<Widget>> doctorsByPlanIdController, String planId);
}