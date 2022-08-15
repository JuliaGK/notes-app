import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notes/app/modules/notes/domain/errors/errors.dart';
import 'package:notes/app/modules/notes/domain/repositories/notes_repository.dart';
import 'package:notes/app/modules/notes/domain/usecases/get_note.dart';

class NotesRepositoryMock extends Mock implements NotesRepository {}

void main() {

  final repository = NotesRepositoryMock();
  final usecase = GetNoteImpl(repository);

  test('Should return true if get notes works', () async {
    final result = await usecase('123');
    expect(result, const Right(true));
  });

  test('Should return an exception when id is empty', () async {
    final result = await usecase('');
    expect(result.leftMap((l) => l is FailureGettingNote), const Left(true));
    
  });
}

