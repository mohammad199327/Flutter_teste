import 'dart:convert';

import 'package:flutter_application_test/CONTROLER/auth/sinupcontroler.dart';
import 'package:flutter_application_test/constant/constant.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'sinupcontroler_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test("signup testing for sucsses", () async {
    final client = MockClient();
    const String firstName = "m";
    const String lastName = "R";
    const String email = "mr";
    const String password = "mmrr";
    const String username = firstName + lastName;
    const int age = 12;
    final mockControler = SignUpController(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        username: username,
        age: age);

    when(client.post(Uri.parse(signUpUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'firstName': firstName,
          'lastName': lastName,
          'age': age,
          'username': username,
          'email': email,
          'password': password,
        }))).thenAnswer((_) async => http.Response('''{
              "firstName":"$firstName"
              ,"lastName":"$lastName",
              "age":"$age"
              ,"username":"$username"
            ,"email":"$email",
            "password":"$password"}''', 200));
    expect(mockControler.firstName, firstName);
    expect(mockControler.lastName, lastName);
    expect(mockControler.age, age);
    expect(mockControler.username, username);
    expect(mockControler.email, email);
    expect(mockControler.password, password);
  });

  test("signup testing for faild ", () async {
    final client = MockClient();
    const String firstName = "m";
    const String lastName = "R";
    const String email = "mr";
    const String password = "mmrr";
    const String username = firstName + lastName;
    const int age = 12;
    final mockControler = SignUpController(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        username: username,
        age: age);

    when(client.post(Uri.parse(signUpUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'firstName': firstName,
          'lastName': lastName,
          'age': age,
          'username': username,
          'email': email,
          'password': password,
        }))).thenAnswer((_) async => http.Response('''{
              "firstName":"$firstName"
              ,"lastName":"$lastName",
              "age":"$age"
              ,"username":"$username"
            ,"email":"$email",
            "password":"$password"}''', 404));
    expect(mockControler.firstName, firstName);
    expect(mockControler.lastName, lastName);
    expect(mockControler.age, age);
    expect(mockControler.username, username);
    expect(mockControler.email, email);
    expect(mockControler.password, password);
  });
}
