import 'dart:io';

class AppInfo {
  const AppInfo({
    required this.name,
    this.description,
    required this.version,
  });

  String get appPath => Directory.current.path;

  final String version;

  final String name;

  final String? description;
}
