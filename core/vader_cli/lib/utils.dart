import 'dart:io' as io;

class Directory {
  static io.Directory get current => io.Directory.current;

  static io.Directory get script {
    Uri scriptUri = io.Platform.script;
    String scriptPath = io.File.fromUri(scriptUri).path;
    return io.File(scriptPath).parent;
  }
}
