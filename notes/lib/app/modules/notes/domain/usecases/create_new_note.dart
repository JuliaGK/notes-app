import 'package:dartz/dartz.dart';
import 'package:notes/app/modules/notes/domain/repositories/notes_repository.dart';

import '../entities/note.dart';
import '../errors/errors.dart';

abstract class CreateNewNote {
  Future<Either<FailureCreatingNewNote, bool>> call(Note newNote);
}

class CreateNewNoteImpl implements CreateNewNote {
  final NotesRepository repository;

  CreateNewNoteImpl(this.repository);

  @override
  Future<Either<FailureCreatingNewNote, bool>> call(Note newNote) async {
    if (newNote.color == '') {
      return Left(FailureCreatingNewNote('Empty color field'));
    } else {
      var result = await repository.createNewNote(newNote);
      if (result.isLeft()) {
        return result.leftMap((l) => l);
      } else {
        return result.map((r) => r);
      }
    }
  }
}
