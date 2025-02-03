abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
}

class EmptyCacheFailure extends Failure {
  EmptyCacheFailure(super.errorMessage);
}

class OfflineFailure extends Failure {
  OfflineFailure(super.errorMessage);
}
