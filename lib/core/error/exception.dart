class ServerException implements Exception {
  String message;
  ServerException({required this.message});
}

class CacheException implements Exception {}

abstract class Failure {}

class ServerFailure extends Failure {
  String message;
  ServerFailure({required this.message});
}

class CacheFailure extends Failure {}

class NoConnectionFailure extends Failure {}
