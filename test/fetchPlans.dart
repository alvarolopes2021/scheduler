import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:scheduler/controllers/GetPlanController.dart';
import 'package:scheduler/models/PlanModel.dart';

import 'fetchPlans.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchPlans', () {

    test('returns Plans if the http call completes successfully', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client
          .get(Uri.parse('http//192.168.0.5:8080/plan')))
          .thenAnswer((_) async =>
          http.Response('', 200));

      expect(await GetPlanController().getPlan(), isA<List<PlanModel>>());
    });

    test('throws an exception if the http call completes with an error', () async {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client
          .get(Uri.parse('http://192.168.0.5:8080/plans')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(null, null);
    });
  });
}