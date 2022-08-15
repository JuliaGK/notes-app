import 'package:dartz/dartz.dart';
import 'package:notes/app/modules/authentication/domain/entities/user.dart';
import 'package:notes/app/modules/authentication/domain/entities/user_credentials.dart';
import 'package:notes/app/modules/authentication/domain/errors/errors.dart';

import '../repositories/authentication_repository.dart';

abstract class LogIn {
  Future<Either<FailureLoggingIn, User>> logIn(UserCredentials userCredentials);
}

class LogInImpl implements LogIn {
  final AuthenticationRepository repository;

  LogInImpl(this.repository);

  @override
  Future<Either<FailureLoggingIn, User>> logIn(
      UserCredentials userCredentials) async {
    if (userCredentials.password.isEmpty | userCredentials.email.isEmpty) {
      return Left(FailureLoggingIn(
          'Failure logging in: email and/or password field is empty'));
    } else {
      var result = await repository.logIn(userCredentials);
      if (result.isLeft()) {
        return result.leftMap((l) => l);
      } else {
        return result.map((r) => r);
      }
    }
  }
}
