class ServerException implements Exception {
  final String errorMessage;
  ServerException(this.errorMessage);
  @override
  String toString() => errorMessage;
}

class EmptyCacheException implements Exception {
  final String errorMessage;
  EmptyCacheException({required this.errorMessage});
  @override
  String toString() => errorMessage;
}
