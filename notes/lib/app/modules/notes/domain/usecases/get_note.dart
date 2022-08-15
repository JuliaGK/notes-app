import 'package:dartz/dartz.dart';

import '../entities/note.dart';
import '../errors/errors.dart';
import '../repositories/notes_repository.dart';

abstract class GetNote {
  Future<Either<FailureGettingNote, Note>> call(String id);
}

class GetNoteImpl implements GetNote {
  final NotesRepository repository;

  GetNoteImpl(this.repository);

  @override
  Future<Either<FailureGettingNote, Note>> call(String id) async {
    if (id.isNotEmpty) {
      var result = await repository.getNote(id);
      if (result.isLeft()) {
        return result.leftMap((l) => l);
      } else {
        return result.map((r) => r);
      }
    } else {
      return Left(FailureGettingNote('Failure getting note: id is empty'));
    }
  }
}
