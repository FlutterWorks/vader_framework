import 'dart:io';

class ExportBuilder {
  ExportBuilder({required this.sourcePoint, required this.packageName});

  final String sourcePoint;
  final String packageName;

  final Set<String> _libPackages = {};
  final Set<String> _srcPackages = {};

  String _convertPathToLibPackage(String path) => path.replaceAll(sourcePoint, 'package:$packageName');

  String _convertPathToSrcPackage(String path) => path.replaceAll('$sourcePoint/', '');

  add(String filePath) {
    _libPackages.add(_convertPathToLibPackage(filePath));
    _srcPackages.add(_convertPathToSrcPackage(filePath));
  }

  addDirectory(String filePath) {
    _libPackages.add(filePath);
  }

  void exportLibPackageProcess(String inputPath, String outputPath) {
    print("Building exports...");

    StringBuffer sb = StringBuffer();
    for (final package in _libPackages) {
      sb.writeln("export '$package';");
    }
    sb.writeln();
    sb.write("""
import 'package:$packageName/design/design.theme.dart';
import 'package:$packageName/theme/dark_theme.dart';
import 'package:$packageName/theme/dark_theme_extension.dart';
import 'package:$packageName/theme/light_theme.dart';
import 'package:$packageName/theme/light_theme_extension.dart';
import 'package:flutter/material.dart';

""");

    final file = File('$inputPath/$packageName.dart');
    sb.write(file.readAsStringSync().replaceAll(RegExp(r"(?:import|export)\s+'[^']+';\n"), ''));
    File('$outputPath/$packageName.dart').writeAsStringSync(sb.toString());
  }

  void exportSrcPackageProcess() {
    print("Building exports...");

    StringBuffer sb = StringBuffer();
    for (final package in _srcPackages) {
      sb.writeln("export '$package';");
    }
    sb.writeln();
    sb.write("""

""");

    File('$sourcePoint/${packageName}_exports.dart').writeAsStringSync(sb.toString());
  }

  build(String targetPoint) {
    exportLibPackageProcess(sourcePoint, targetPoint);
    exportSrcPackageProcess();
  }
}
