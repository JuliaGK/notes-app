import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import '../errors/errors.dart';

abstract class NotesDatasource {
  Future<Either<FailureCreatingNewNoteInDatasource, bool>> createNote(Map note);
  Future<Either<FailureUpdatingExistingNoteInDatasource, bool>> updateNote(Map note);
  Future<Either<FailureDeletingNoteInDatasource, bool>> deleteNote(String id);
  Future<Either<FailureGettingNoteInDatasource, Map>> getNote(String id);
  Future<Either<FailureGettingNotesQueryInDatasource, Query>> getNotesQuery();
}