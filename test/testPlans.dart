import 'package:flutter_test/flutter_test.dart';
import 'package:scheduler/models/DoctorsModel.dart';
import 'package:scheduler/models/PlanModel.dart';
import 'package:scheduler/services/servicesImpl/DoctorsByPlanIdImpl.dart';
import 'package:scheduler/services/servicesImpl/PlanServicesImpl.dart';

void main(){
  test('Testa se o parse da resposta da API gera uma lista de Planos', () async {
    final planServiceImpl = PlanServicesImpl();

    expect(await planServiceImpl.testPlanModel(), isA<List<PlanModel>>());
  });

  test('Testa se o parse da resposta da API gera uma lista de Médicos', () async {
    final doctorsByPlanIdService = DoctorsByPlanIdImpl();

    expect(await doctorsByPlanIdService.testDoctorsModel('3'), isA<List<DoctorsModel>>());
  });

  test('Testa se o parse da resposta da API gera uma lista de Médicos', () async {
    final doctorsByPlanIdService = DoctorsByPlanIdImpl();

    expect(await doctorsByPlanIdService.testDoctorsModel('1'), isEmpty);
  });
}