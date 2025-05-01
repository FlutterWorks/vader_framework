import 'dart:convert';
import 'package:shelf_plus/shelf_plus.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

class HelloModule {
  static Handler handler() {
    var app = Router().plus;

    app.get('/', () => 'Hello World!\n');

    app.get('/hello', (Request req) => 'Hello ${req.url.queryParameters['name'] ?? 'World'}!!\n');

    app.post('/json', (Request req) async {
      var body = await req.body.asJson;

      var name = body['name'] ?? 'Unknown';
      var age = body['age'] ?? 0;

      var response = {'message': 'Hello, $name!', 'ageInFiveYears': age + 5};

      return Response.ok('${jsonEncode(response)}\n', headers: {'Content-Type': 'application/json'});
    });

    return corsHeaders() >> app.call;
  }
}
