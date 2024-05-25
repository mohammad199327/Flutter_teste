import 'package:flutter_application_test/constant/constant.dart';
import 'package:flutter_application_test/testmockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'testmockito_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('testmockito ...', () async {
    final client = MockClient();
    when(client.get(Uri.parse(loginUrl))).thenAnswer((_) async =>
        http.Response('{"userId": 1, "id": 2, "title": "test"}', 200));

    final album = await fetchAlbum(client);

    expect(album, isA<Album>());
    expect(album.id, 2);
    expect(album.title, 'test');
  });

  test("throw  an exception if http call completets with an error", () async {
    final client = MockClient();
    when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
        .thenAnswer((_) async => http.Response('Note found', 404));
    expect(fetchAlbum(client), throwsException);
  });
}
