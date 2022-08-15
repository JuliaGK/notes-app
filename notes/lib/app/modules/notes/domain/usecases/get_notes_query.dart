import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';

import '../errors/errors.dart';
import '../repositories/notes_repository.dart';

abstract class GetNotesQuery {
  Future<Either<FailureGettingNotesQuery, Query>> getNotesQuery();
}

class GetNotesQueryImpl implements GetNotesQuery {
  final NotesRepository repository;

  GetNotesQueryImpl(this.repository);

  @override
  Future<Either<FailureGettingNotesQuery, Query>> getNotesQuery() async {
    var result = await repository.getNotesQuery();
    if (result.isLeft()) {
      return result.leftMap((l) => l);
    } else {
      return result.map((r) => r);
    }
  }
}
