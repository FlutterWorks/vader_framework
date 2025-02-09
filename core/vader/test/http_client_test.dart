import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:test/test.dart';
import 'package:vader/vader.dart';
import 'package:vader_core/foundation/global.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjector(httpClient: HttpClient(apiUrl: "https://dummyjson.com", enableLogs: true, preventLargeResponses: false));
  final httpClient = repositoryInjector.get<HttpClient>();

  test('HttpClient', () async {
    print('\nHttpClient:');
    final response = await httpClient.request(
      path: '/test',
      method: HttpMethod.get,
    );
    final result = jsonEncode(response.data).toString();
    expect(result, '{"status":"ok","method":"GET"}');
  });

}
