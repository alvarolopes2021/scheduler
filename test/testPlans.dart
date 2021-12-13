import 'package:flutter_test/flutter_test.dart';
import 'package:scheduler/models/DoctorTimeModel.dart';
import 'package:scheduler/models/DoctorsModel.dart';
import 'package:scheduler/models/PlanModel.dart';
import 'package:scheduler/services/servicesImpl/DoctorsByPlanIdImpl.dart';
import 'package:scheduler/services/servicesImpl/GetDoctorTimeByPlanIdAndDoctorIdImpl.dart';
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

    expect(await doctorsByPlanIdService.testDoctorsModel('3'), isEmpty);
  });

  test('Testa se o parse da resposta da API gera um horário de médico', () async {
    final doctorsByPlanIdService = GetDoctorTimeByPlanIdAndDoctorIdImpl();

    expect(await doctorsByPlanIdService.testDoctorTime('1','1'), isA<DoctorsTimeModel>());
  });
}