import 'package:vader_core/clients/http_client.dart';
import 'package:vader_core/clients/storage_client.dart';

abstract class Repository {
  const Repository({
    required this.httpClient,
    required this.storageClient,
  });

  final HttpClient httpClient;

  final StorageClient storageClient;
}
