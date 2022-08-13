import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';

import '../errors/errors.dart';
import '../repositories/notes_repository.dart';

abstract class GetNotesQuery {
  Future<Either<FailureGettingNotesQuery, Query>> call();
}

class GetNotesQueryImpl implements GetNotesQuery {

  final NotesRepository repository;

  GetNotesQueryImpl(this.repository);

  @override
  Future<Either<FailureGettingNotesQuery, Query>> call() async {
    try {
      Query notesQuery;
      notesQuery = repository.getNotesQuery() as Query;
      return Right(notesQuery);
    } catch (e) {
      return Left(FailureGettingNotesQuery('Failure getting notes query'));
    }
  }

}