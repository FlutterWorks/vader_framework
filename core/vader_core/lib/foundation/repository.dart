import 'package:vader_core/clients/http_client.dart';

abstract class Repository {
  const Repository({required this.httpClient});

  final HttpClient httpClient;

}
