import 'dart:convert';

import 'package:flutter_application_test/CONTROLER/auth/login.dart';
import 'package:flutter_application_test/constant/constant.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'login_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('signin contoler', () {
    test('testmockito ...', () async {
      const String username = "emilys";
      const String passowrd = "emilyspass";

      final controller = SignInController(username, passowrd);
      final client = MockClient();

      when(client.post(Uri.parse(loginUrl),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode({
                'username': username,
                'password': passowrd,

                'expiresInMins': 30, // optional, defaults to 60
              })))
          .thenAnswer((_) async => http.Response(
              '{"username": "emilys", "password": "emilyspass" }', 200));

      expect(controller.username, "emilys");
      expect(controller.passowrd, "emilyspass");
    });

    test("throw  an exception if http call completets with an error", () async {
      const String username = "emilys";
      const String passowrd = "emilyspass";
      final client = MockClient();
      final controle = SignInController(username, passowrd);
      when(client.post(Uri.parse(loginUrl),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode({
                'username': username,
                'password': passowrd,

                'expiresInMins': 30, // optional, defaults to 60
              })))
          .thenAnswer((_) async => http.Response(
              '{"username": "emilys", "password": "emilyspass" }', 404));

      expect(controle.username, "emilys");
      expect(controle.passowrd, "emilyspass");
    });
  });
}
