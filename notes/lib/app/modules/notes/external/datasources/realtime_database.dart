import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:notes/app/modules/notes/infra/errors/errors.dart';

import '../../infra/datasources/notes_database.dart';

class RealtimeDatabase implements NotesDatasource {
  // TIRAR UID PARA A PARTE DE AUTHENTICATION
  String uid = 'x';
  DatabaseReference ref = FirebaseDatabase.instance.ref('users/uid/notes');
  RealtimeDatabase();

  @override
  Future<Either<FailureCreatingNewNoteInDatasource, bool>> createNote(
      Map note) async {
    try {
      var newNoteId = ref.push().key;
      ref = ref.child(newNoteId!);
      await ref.set({
        "title": note['title'],
        "text": note['body'],
        "datetime_created": note['creation_date'],
        "color": note['color']
      });
      return const Right(true);
    } catch (e) {
      return Left(FailureCreatingNewNoteInDatasource(
          'Failure trying to create note in datasource'));
    }
  }

  @override
  Future<Either<FailureDeletingNoteInDatasource, bool>> deleteNote(
      String id) async {
    try {
      await ref.child('id').remove();
      return const Right(true);
    } catch (e) {
      return Left(FailureDeletingNoteInDatasource(
          'Failure trying to delete note in datasource'));
    }
  }

  @override
  Future<Either<FailureGettingNoteInDatasource, Map>> getNote(String id) async {
    final snapshot = await ref.child('id').get();
    if (snapshot.exists) {
      return Right(snapshot.value as Map);
    } else {
      return Left(FailureGettingNoteInDatasource(
          'Failure trying to get note in datasource'));
    }
  }

  @override
  Future<Either<FailureGettingNotesQueryInDatasource, Query>>
      getNotesQuery() async {
    try {
      final query = ref.orderByKey();
      return Right(query);
    } catch (e) {
      return Left(FailureGettingNotesQueryInDatasource(
          'Failure trying to get notes query'));
    }
  }

  @override
  Future<Either<FailureUpdatingExistingNoteInDatasource, bool>> updateNote(
      Map note) async {
    try {
      var newNoteId = ref.push().key;
      ref = ref.child(newNoteId!);
      await ref.update({
        note['id']: {
          "title": note['title'],
          "text": note['body'],
          "color": note['color']
        }
      });
      return const Right(true);
    } catch (e) {
      return Left(FailureUpdatingExistingNoteInDatasource(
          'Failure trying to update note in datasource'));
    }
  }
}
