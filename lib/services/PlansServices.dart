import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class PlansServices{
  Future<List<Widget>> generatePlans(StreamController<List<Widget>> plansController);
}