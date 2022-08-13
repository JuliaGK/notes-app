import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';

import '../entities/note.dart';
import '../errors/errors.dart';

abstract class NotesRepository {
  Future<Either<FailureCreatingNewNote, bool>> createNewNote(Note newNote);
  Future<Either<FailureEditingExistingNote, bool>> updateExistingNote(Note existingNote);
  Future<Either<FailureGettingNotesQuery, Query>> getNotesQuery();
  Future<Either<FailureDeletingNote, bool>> deleteNote(String id);
  Future<Either<FailureGettingNote, Note>> getNote(String id);
}