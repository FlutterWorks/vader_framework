import 'package:vader_app/vader_app.dart';

class PaymentRepository extends Repository {
  PaymentRepository({
    required super.httpClient,
    required super.storageClient,
  });

  Future<String> getSomething() async {
    return Future.value('Hello world');
  }
}
