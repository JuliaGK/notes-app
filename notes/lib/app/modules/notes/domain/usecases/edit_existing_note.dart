import 'package:dartz/dartz.dart';

import '../entities/note.dart';
import '../errors/errors.dart';
import '../repositories/notes_repository.dart';

abstract class EditExistingNote {
  Future<Either<FailureEditingExistingNote, bool>> call(Note existingNote);
}

class EditExistingNoteImpl implements EditExistingNote {
  final NotesRepository repository;

  EditExistingNoteImpl(this.repository);

  @override
  Future<Either<FailureEditingExistingNote, bool>> call(
      Note existingNote) async {
    if (existingNote.id == '') {
      return Left(FailureEditingExistingNote('Failure editing existing note'));
    } else {
      var result = await repository.updateExistingNote(existingNote);
      if(result.isLeft()){
        return result.leftMap((l) => l);
      } else {
        return result.map((r) => r);
      }
    }
  }
}
