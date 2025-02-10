import 'dart:io';

import 'package:vader_core/clients/logger.dart';
import 'package:vader_core/clients/storage_client.dart';

class Cache {
  Cache({
    String name = 'defaultCache',
    this.duration = const Duration(hours: 1),
    StorageClient? storageClient,
  }) {
    _cacheDb = storageClient ?? StorageClient(name: name, path: Directory.systemTemp.path);
  }

  late final StorageClient _cacheDb;
  final Duration duration;

  Future<Map> get({
    required String key,
    Duration? duration,
    required Future<Map> Function() process,
  }) async {
    final Map? data = await _cacheDb.getMap(key);
    final untilTime = DateTime.now().millisecondsSinceEpoch - (duration ?? this.duration).inMilliseconds;
    if (data != null && data['time'] > untilTime) {
      logger.debug('Obtain data from cache: $key');
      return data['data'];
    }

    final Map response = await process.call();

    await _cacheDb.saveMap(key, {
      'time': DateTime.now().millisecondsSinceEpoch,
      'data': response,
    });

    return response;
  }
}
