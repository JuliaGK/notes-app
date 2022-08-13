import 'package:dartz/dartz.dart';
import 'package:notes/app/modules/notes/domain/repositories/notes_repository.dart';

import '../errors/errors.dart';

abstract class DeleteNote {
  Future<Either<FailureDeletingNote, bool>> call(String id);
}

class DeleteNoteImpl implements DeleteNote{

  final NotesRepository repository;

  DeleteNoteImpl(this.repository);

  @override
  Future<Either<FailureDeletingNote, bool>> call(String id) async {
    try {
      repository.deleteNote(id);
      return const Right(true);
    } catch (e) {
      return Left(FailureDeletingNote('Failure editing existing note'));
    }
   }
}