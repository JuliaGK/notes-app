import 'package:dartz/dartz.dart';
import 'package:notes/app/modules/authentication/domain/entities/user.dart';
import 'package:notes/app/modules/authentication/domain/errors/errors.dart';

import '../repositories/authentication_repository.dart';

abstract class GetLoggedUser {
  Future<Either<FailureGettingLoggedUser, User>> getLoggedUser();
}

class GetLoggedUserImpl implements GetLoggedUser {
  final AuthenticationRepository repository;

  GetLoggedUserImpl(this.repository);

  @override
  Future<Either<FailureGettingLoggedUser, User>> getLoggedUser() async {
    var result = await repository.getLoggedUser();
    if(result.isLeft()) {
      return result.leftMap((l) => l);
    } else {
      return result.map((r) => r);
    }
  }
}
