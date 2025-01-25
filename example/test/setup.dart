import 'package:example/global.dart';
import 'package:vader/framework.dart' hide setupInjector;

setupData(Function() setupFakeData, {required bool useFakeData}) {
  final apiUrl = "https://dummyjson.com";
  if (useFakeData) {
    print('Using fake data..');
    setupFakeData();
  } else {
    print('Using real data from: $apiUrl');
    setupInjector(
      httpClient: HttpClient(
        apiUrl: apiUrl,
        enableLogs: true,
        preventLargeResponses: false,
      ),
    );
  }
}
