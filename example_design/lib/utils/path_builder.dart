import 'package:stack_trace/stack_trace.dart' as stacktrace;

String goldenTestPathBuilder(c) {
  List<String> path = stacktrace.Frame.caller(1).library.split('/');
  path = path.sublist(2, path.length - 1);
  final componentPath = path.join('/');
  final useCasePath = (c.path as String).split('/').fold(
    [],
        (p, e) => path.contains(e) ? p : p
      ..add(e),
  ).join('/');
  return "${c.rootPath}/$componentPath/golden_tests/$useCasePath/${c.file}";
}
