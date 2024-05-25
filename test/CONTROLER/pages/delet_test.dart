import 'package:flutter_application_test/CONTROLER/pages/homecontroler.dart';
import 'package:flutter_application_test/constant/constant.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../testmockito_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('HomeControler', () {
    test("delete test ", () async {
      final client = MockClient();
      const String id = "1";
      final controler = HomeControler(id: id);

      when(client.delete(Uri.parse("$delettodo$id")))
          .thenAnswer((_) async => http.Response("Deleted Successfully", 200));
      expect(controler.id, id);
    });
    test("delete test ", () async {
      final client = MockClient();

      const String id = "1";
      final controler = HomeControler(id: id);
      when(client.delete(Uri.parse("$delettodo$id"))).thenAnswer(
          (_) async => http.Response("Error cant delete data", 404));
      expect(controler.id, id);
    });
  });
}
