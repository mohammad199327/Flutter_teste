import 'dart:convert';

import 'package:flutter_application_test/CONTROLER/pages/updateControler.dart';
import 'package:flutter_application_test/constant/constant.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'sinupcontroler_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('Update controler', () {
    test('update testing ...', () async {
      final client = MockClient();

      const String todId = "10";
      const String todo = "tt";

      final controler = UpdateControler(todoId: todId, todo: todo);
      when(client.put(Uri.parse("$updatepath $todId"),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'todo': todo,
          }))).thenAnswer((_) async => http.Response('"todo":"$todo"', 200));
      expect(controler.todo, "tt");
    });

    test('update testing faild ...', () async {
      final client = MockClient();

      const String todId = "10";
      const String todo = "tt";

      final controler = UpdateControler(todoId: todId, todo: todo);
      when(client.put(Uri.parse("$updatepath $todId"),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'todo': todo,
          }))).thenAnswer((_) async => http.Response('"todo":"$todo"', 404));
      expect(controler.todo, todo);
    });
  });
}
