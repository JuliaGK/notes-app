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
      Map noteMap = newNote.toMap();
      noteMap['datetimeCreated'] = DateTime.now();
      var result = await notesDatasourse.createNote(newNote.toMap());
      return Right(result);
    } catch (e) {
      return Left(FailureCreatingNewNote('Failure creating new note in implemention'));
    }
  }

  @override
  Future<Either<FailureDeletingNote, bool>> deleteNote(String id) async {
    try {
      var result = await notesDatasourse.deleteNote(id);
      return Right(result);
    } catch (e) {
      return Left(FailureDeletingNote('Failure deleting note in implemention'));
    }
  }

  @override
  Future<Either<FailureGettingNote, Note>> getNote(String id) async {
    try {
      var mapNote = await notesDatasourse.getNote(id);
      Note note = Note(id: id, title: mapNote["title"], content: mapNote["text"], color: mapNote["color"], datetimeCreated: mapNote["datetime_created"]);
      return Right(note);
    } catch (e) {
      return Left(FailureGettingNote('Failure getting note in implemention'));
    }
  }

  @override
  Future<Either<FailureGettingNotesQuery, Query>> getNotesQuery() async {
    try {
      var result = await notesDatasourse.getNotesQuery();
      return Right(result);
    } catch (e) {
      return Left(FailureGettingNotesQuery('Failure getting notes query in implemention'));
    }
  }

  @override
  Future<Either<FailureEditingExistingNote, bool>> updateExistingNote(Note existingNote) async {
    try {
      var result = await notesDatasourse.updateNote(existingNote.toMap());
      return Right(result);
    } catch (e) {
      return Left(FailureEditingExistingNote('Failure editing existing note in implemention'));
    }
  }
}