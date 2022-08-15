import 'package:dartz/dartz.dart';
import 'package:notes/app/modules/authentication/domain/entities/user.dart';
import 'package:notes/app/modules/authentication/domain/entities/user_credentials.dart';
import 'package:notes/app/modules/authentication/domain/errors/errors.dart';

import '../repositories/authentication_repository.dart';

abstract class SignUp {
  Future<Either<FailureSigningUp, User>> signUp(
      UserCredentials userCredentials);
}

class SignUpImpl implements SignUp {
  final AuthenticationRepository repository;

  SignUpImpl(this.repository);

  @override
  Future<Either<FailureSigningUp, User>> signUp(
      UserCredentials userCredentials) async {
    if (userCredentials.password.isEmpty | userCredentials.email.isEmpty) {
      return Left(FailureSigningUp(
          'Failure signing up: email and/or password field is empty'));
    } else {
      var result = await repository.signUp(userCredentials);
      if (result.isLeft()) {
        return result.leftMap((l) => l);
      } else {
        return result.map((r) => r);
      }
    }
  }
}
