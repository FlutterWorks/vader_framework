import 'package:vader_framework/vader_framework.dart';

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
