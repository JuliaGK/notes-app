import 'package:dartz/dartz.dart';
import 'package:notes/app/modules/authentication/domain/entities/user.dart';
import 'package:notes/app/modules/authentication/domain/entities/user_credentials.dart';
import 'package:notes/app/modules/authentication/domain/errors/errors.dart';
import 'package:notes/app/modules/authentication/domain/repositories/authentication_repository.dart';
import 'package:string_validator/string_validator.dart' as validator;

abstract class ChangePassword {
  Future<Either<FailureChangingPassword, bool>> changePassword(
      UserCredentials userCredentials);
}

class ChangePasswordImpl implements ChangePassword {
  final AuthenticationRepository repository;

  ChangePasswordImpl(this.repository);

  @override
  Future<Either<FailureChangingPassword, bool>> changePassword(
      UserCredentials userCredentials) async {
    if (userCredentials.email.isEmpty) {
      return Left(
          FailureChangingPassword('Failure changing password: email is empty'));
    } else if (!validator.isEmail(userCredentials.email)) {
      return Left(FailureChangingPassword(
          'Failure changing password: email is not valid'));
    } else {
      var result = await repository.changePassword(userCredentials);
      if (result.isLeft()) {
        return result.leftMap((l) => l);
      } else {
        return result.map((r) => r);
      }
    }
  }
}
