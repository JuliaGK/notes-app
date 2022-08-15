abstract class Failure implements Exception {
  String get message;
}

class FailureLoggingIn extends Failure {
  @override
  final String message;

  FailureLoggingIn(this.message);

}

class FailureLoggingOut extends Failure {
  @override
  final String message;
  
  FailureLoggingOut(this.message);

}

class FailureSigningUp extends Failure {
  @override
  final String message;
  
  FailureSigningUp(this.message);

}

class FailureGettingLoggedUser extends Failure {
  @override
  final String message;
  
  FailureGettingLoggedUser(this.message);

}

class FailureChangingPassword extends Failure {
  @override
  final String message;
  
  FailureChangingPassword(this.message);

}