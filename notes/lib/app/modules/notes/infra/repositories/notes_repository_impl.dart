import 'package:firebase_database/firebase_database.dart';


import 'package:dartz/dartz.dart';
import 'package:notes/app/modules/notes/domain/entities/note.dart';
import 'package:notes/app/modules/notes/domain/errors/errors.dart';

import '../../domain/repositories/notes_repository.dart';
import '../datasources/notes_database.dart';

class NotesRepositoryImpl implements NotesRepository {

  final NotesDatasource notesDatasourse;

  NotesRepositoryImpl(this.notesDatasourse);

  @override
  Future<Either<FailureCreatingNewNote, bool>> createNewNote(Note newNote) async {
    try {
      notesDatasourse.createNote(newNote.toMap());
      return const Right(true);
    } catch (e) {
      return Left(FailureCreatingNewNote('Failure creating new note in implemention'));
    }
  }

  @override
  Future<Either<FailureDeletingNote, bool>> deleteNote(String id) async {
    try {
      notesDatasourse.deleteNote(id);
      return const Right(true);
    } catch (e) {
      return Left(FailureDeletingNote('Failure deleting note in implemention'));
    }
  }

  @override
  Future<Either<FailureGettingNote, Note>> getNote(String id) async {
    try {
      Note note = notesDatasourse.getNote(id) as Note;
      return Right(note);
    } catch (e) {
      return Left(FailureGettingNote('Failure getting note in implemention'));
    }
  }

  @override
  Future<Either<FailureGettingNotesQuery, Query>> getNotesQuery() async {
    try {
      Query query = notesDatasourse.getNotesQuery() as Query;
      return Right(query);
    } catch (e) {
      return Left(FailureGettingNotesQuery('Failure getting notes query in implemention'));
    }
  }

  @override
  Future<Either<FailureEditingExistingNote, bool>> updateExistingNote(Note existingNote) async {
    try {
      notesDatasourse.createNote(existingNote.toMap());
      return const Right(true);
    } catch (e) {
      return Left(FailureEditingExistingNote('Failure editing existing note in implemention'));
    }
  }
}