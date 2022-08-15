abstract class Failure implements Exception {
  String get message;
}

class FailureLoggingInDatasource extends Failure {
  @override
  final String message;

  FailureLoggingInDatasource(this.message);

}

class FailureLoggingOutInDatasource extends Failure {
  @override
  final String message;
  
  FailureLoggingOutInDatasource(this.message);

}

class FailureSigningUpInDatasource extends Failure {
  @override
  final String message;
  
  FailureSigningUpInDatasource(this.message);

}

class FailureGettingLoggedUserInDatasource extends Failure {
  @override
  final String message;
  
  FailureGettingLoggedUserInDatasource(this.message);

}

class FailureChangingPasswordInDatasource extends Failure {
  @override
  final String message;
  
  FailureChangingPasswordInDatasource(this.message);

}