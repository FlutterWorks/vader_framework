class MissingOptionException implements Exception {
  final String message;

  const MissingOptionException({required this.message});

}

class MissingMultipleOptionException implements Exception {
  final String message;

  const MissingMultipleOptionException({required this.message});
}
