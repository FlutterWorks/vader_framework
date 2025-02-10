import 'package:test/test.dart';
import 'package:vader_core/clients/cache_client.dart';

performantProcess() {
  print('Running performant process...');
  return Future.delayed(
    Duration(seconds: 5),
        () => {'payload': 'Computed value'},
  );
}

void main() {
  test('Cache save', () async {
    print('\nCache init:');

    final cache = Cache();
    await Future.delayed(Duration(seconds: 1));

    print('\nRun process');
    var result = await cache.get(
      key: 'random_key',
      duration: Duration(seconds: 10),
      process: () => performantProcess(),
    );
    expect(result, {'payload': 'Computed value'});

    print('\nRun process again');
    result = await cache.get(
      key: 'random_key',
      duration: Duration(seconds: 10),
      process: () => performantProcess(),
    );
    expect(result, {'payload': 'Computed value'});
    print('Obtain data from cache');

    await Future.delayed(Duration(seconds: 2));

    print('\nRun process after cache delay');
    result = await cache.get(
      key: 'random_key',
      duration: Duration(seconds: 1),
      process: () => performantProcess(),
    );

    expect(result, {'payload': 'Computed value'});
  });
}
