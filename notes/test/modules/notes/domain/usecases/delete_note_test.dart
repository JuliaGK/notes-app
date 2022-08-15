import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes/app/modules/notes/domain/entities/note.dart';
import 'package:notes/app/modules/notes/domain/errors/errors.dart';
import 'package:notes/app/modules/notes/domain/repositories/notes_repository.dart';
import 'package:notes/app/modules/notes/domain/usecases/delete_note.dart';

class NotesRepositoryMock extends Mock implements NotesRepository {}

void main() {

  final repository = NotesRepositoryMock();
  final usecase = DeleteNoteImpl(repository);

  test('Should return true if note is deleted', () async {
    final result = await usecase('123');
    expect(result, const Right(true));
  });

  test('Should return an exception when id is empty', () async {
    final result = await usecase('');
    expect(result.leftMap((l) => l is FailureDeletingNote), const Left(true));
    
  });
}

