import 'package:notes/app/modules/authentication/domain/entities/user_credentials.dart';
import 'package:notes/app/modules/authentication/domain/errors/errors.dart';
import 'package:notes/app/modules/authentication/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:notes/app/modules/authentication/domain/repositories/authentication_repository.dart';
import 'package:notes/app/modules/authentication/infra/datasources/authentication_database.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDatabase datasource;

  AuthenticationRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureChangingPassword, bool>> changePassword(
      UserCredentials userCredentials) async {
    try {
      var result = await datasource.changePassword(userCredentials.toMap());
      return Right(result);
    } catch (e) {
      return Left(FailureChangingPassword(e.toString()));
    }
  }

  @override
  Future<Either<FailureGettingLoggedUser, User>> getLoggedUser() async {
    try {
      var result = await datasource.getLoggedUser();
      return Right(result);
    } catch (e) {
      return Left(FailureGettingLoggedUser(e.toString()));
    }
  }

  @override
  Future<Either<FailureLoggingIn, User>> logIn(
      UserCredentials userCredentials) async {
    try {
      var result = await datasource.logIn(userCredentials.toMap());
      return Right(result);
    } catch (e) {
      return Left(FailureLoggingIn(e.toString()));
    }
  }

  @override
  Future<Either<FailureLoggingOut, bool>> logOut() async {
    try {
      var logOut = await datasource.logOut();
      return Right(logOut);
    } catch (e) {
      return Left(FailureLoggingOut(e.toString()));
    }
  }

  @override
  Future<Either<FailureSigningUp, User>> signUp(
      UserCredentials userCredentials) async {
    try {
      var result =await datasource.signUp(userCredentials.toMap());
      return Right(result);
    } catch (e) {
      return Left(FailureSigningUp(e.toString()));
    }
  }
}
