import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:vader_core/clients/cache_client.dart';
import 'package:vader_core/clients/storage_client.dart';

performantProcess() {
  print('Running performant process...');
  return Future.delayed(
    Duration(seconds: 3),
    () => {'payload': 'Computed value'},
  );
}

void main() {
  test('Cache save', () async {
    print('\nCache init:');

    final storageClient = StorageClientMock();
    const key = 'random_key';

    when(() => storageClient.saveMap(key, any())).thenAnswer(
      (i) => Future.value(),
    );

    when(() => storageClient.getMap(key)).thenAnswer(
      (i) => Future.value({
        'time': DateTime.now().subtract(Duration(seconds: 11)).millisecondsSinceEpoch,
        'data': {'payload': 'Cached value'},
      }),
    );

    final cache = Cache(storageClient: storageClient);
    await Future.delayed(Duration(seconds: 1));

    print('\nRun process');
    var result = await cache.get(
      key: key,
      duration: Duration(seconds: 10),
      process: () => performantProcess(),
    );
    expect(result, {'payload': 'Computed value'});

    print('\nObtain data from cache');
    result = await cache.get(
      key: key,
      duration: Duration(seconds: 12),
      process: () => performantProcess(),
    );
    expect(result, {'payload': 'Cached value'});
    print('Data obtained from cache');

    await Future.delayed(Duration(seconds: 10));

    print('\nObtain data after cache delay');
    result = await cache.get(
      key: key,
      duration: Duration(seconds: 1),
      process: () => performantProcess(),
    );

    expect(result, {'payload': 'Computed value'});
  });
}
