import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:vader_core/framework.dart';
import 'package:vader_core/foundation/global.dart';

void main() {
  setupInjector(
    httpClient: HttpClient(apiUrl: "https://dummyjson.com", enableLogs: true, preventLargeResponses: false),
    storageClient: StorageClient(path: Directory.systemTemp.path),
  ).commit();

  final httpClient = repositoryInjector.get<HttpClient>();

  test('HttpClient request', () async {
    print('\nHttpClient request:');
    final response = await httpClient.request(
      path: '/test',
      method: HttpMethod.get,
    );
    final result = jsonEncode(response.data).toString();
    expect(result, '{"status":"ok","method":"GET"}');
  });

  test('HttpClient fetch', () async {
    print('\nHttpClient fetch:');
    final response = await httpClient.fetch(
      path: '/test',
    );
    final result = jsonEncode(response.data).toString();
    expect(result, '{"status":"ok","method":"GET"}');
  });
}
