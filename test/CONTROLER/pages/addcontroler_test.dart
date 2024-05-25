import 'dart:convert';

import 'package:flutter_application_test/CONTROLER/pages/addcontroler.dart';
import 'package:flutter_application_test/constant/constant.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../testmockito_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("add controler", () {
    test('addcontroler  ...', () async {
      final client = MockClient();
      const String todo = '';
      const String userId = '';
      final controller = AddControler(todo: todo, userId: userId);

      when(client.post(
        Uri.parse(addtodopath),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'todo': todo,
          'completed': true,
          'userId': userId,
        }),
      )).thenAnswer((_) async => http.Response('''
        'todo': $todo,
        'completed': true,
        'userId': $userId,
''', 200));
      expect(controller.todo, todo);
      expect(controller.userId, userId);
    });

    test('addcontroler ...', () async {
      final client = MockClient();
      const String todo = '';
      const String userId = '';
      final controller = AddControler(todo: todo, userId: userId);

      when(client.post(
        Uri.parse(addtodopath),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'todo': todo,
          'completed': true,
          'userId': userId,
        }),
      )).thenAnswer((_) async => http.Response('''
        'todo': $todo,
        'completed': true,
        'userId': $userId,
        ''', 404));
      expect(controller.todo, todo);
      expect(controller.userId, userId);
    });
  });
}
