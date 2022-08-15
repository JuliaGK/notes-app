import 'package:dartz/dartz.dart';
import 'package:notes/app/modules/notes/domain/repositories/notes_repository.dart';

import '../errors/errors.dart';

abstract class DeleteNote {
  Future<Either<FailureDeletingNote, bool>> call(String id);
}

class DeleteNoteImpl implements DeleteNote {
  final NotesRepository repository;

  DeleteNoteImpl(this.repository);

  @override
  Future<Either<FailureDeletingNote, bool>> call(String id) async {
    if (id != '') {
      var result = await repository.deleteNote(id);
      if(result.isLeft()){
        return result.leftMap((l) => l);
      } else {
        return result.map((r) => r);
      }
    } else {
      return Left(FailureDeletingNote('Failure deleting note: id is empty'));
    }
  }
}
