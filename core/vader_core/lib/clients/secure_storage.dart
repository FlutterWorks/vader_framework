import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:mocktail/mocktail.dart';

class StorageClientMock extends Mock implements StorageClient {}

class StorageClient {
  late final Box _storage;

  StorageClient({String name = 'defaultBox', String? path}) {
    Hive.openBox(name, path: path).then((box) => _storage = box);
  }

  Future<int> removeAll() async {
    return _storage.clear();
  }

  Future<void> remove(String key) {
    return _storage.delete(key);
  }

  Future<void> saveString(String key, String value) {
    return _storage.put(key, value);
  }

  Future<String?> getString(String key) {
    return _storage.get(key);
  }

  Future<void> saveMap(String key, Map value) {
    return _storage.put(key, json.encode(value));
  }

  Future<dynamic> getMap(String key) async {
    return json.decode((await _storage.get(key)).toString());
  }
}
