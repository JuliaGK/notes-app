import 'package:dartz/dartz.dart';

import '../errors/errors.dart';
import '../repositories/notes_repository.dart';

abstract class GetNote {
  Future<Either<FailureGettingNote, bool>> call(String id);
}

class GetNoteImpl implements GetNote{

  final NotesRepository repository;

  GetNoteImpl(this.repository);

  @override
  Future<Either<FailureGettingNote, bool>> call(String id) async {
    try {
      repository.getNote(id);
      return const Right(true);
    } catch (e) {
      return Left(FailureGettingNote('Failure getting note'));
    }
   }
}