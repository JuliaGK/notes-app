import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notes/app/modules/notes/domain/entities/note.dart';
import 'package:notes/app/modules/notes/domain/errors/errors.dart';
import 'package:notes/app/modules/notes/domain/repositories/notes_repository.dart';
import 'package:notes/app/modules/notes/domain/usecases/edit_existing_note.dart';
import 'package:notes/app/modules/notes/infra/errors/errors.dart';

class NotesRepositoryMock extends Mock implements NotesRepository {}

void main() {

  final repository = NotesRepositoryMock();
  final usecase = EditExistingNoteImpl(repository);

  test('Should return true if note is created', () async {
    Note existingNote = Note(id:'1', title: 'title', content: 'content', color: 'color');
    final result = await usecase(existingNote);
    expect(result, const Right(true));
  });

  test('Should return an exception when id is empty', () async {
    Note existingNote = Note(title: 'title', content: 'content', color: 'color');
    final result = await usecase(existingNote);
    expect(result.leftMap((l) => l is FailureEditingExistingNote), const Left(true));
    
  });
}

