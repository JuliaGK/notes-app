import 'package:dartz/dartz.dart';
import 'package:notes/app/modules/authentication/domain/errors/errors.dart';

import '../repositories/authentication_repository.dart';

abstract class LogOut {
  Future<Either<FailureLoggingOut, bool>> logOut();
}

class LogOutImpl implements LogOut {
  final AuthenticationRepository repository;

  LogOutImpl(this.repository);

  @override
  Future<Either<FailureLoggingOut, bool>> logOut() async {
    var result = await repository.logOut();
    if (result.isLeft()) {
      return result.leftMap((l) => l);
    } else {
      return result.map((r) => r);
    }
  }
}
