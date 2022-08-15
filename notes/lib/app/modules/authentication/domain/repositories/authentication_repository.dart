import 'package:dartz/dartz.dart';
import 'package:notes/app/modules/authentication/domain/entities/user_credentials.dart';
import 'package:notes/app/modules/authentication/domain/errors/errors.dart';

import '../entities/user.dart';

abstract class AuthenticationRepository {
  Future<Either<FailureChangingPassword, bool>> changePassword(UserCredentials userCredentials);
  Future<Either<FailureLoggingIn, User>> logIn(UserCredentials userCredentials);
  Future<Either<FailureLoggingOut, bool>> logOut();
  Future<Either<FailureSigningUp, User>> signUp(UserCredentials userCredentials);
  Future<Either<FailureGettingLoggedUser, User>> getLoggedUser();
}