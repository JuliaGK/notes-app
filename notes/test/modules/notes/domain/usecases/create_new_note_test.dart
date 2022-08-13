import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:notes/modules/notes/domain/entities/note.dart';
import 'package:notes/modules/notes/domain/errors/errors.dart';
import 'package:notes/modules/notes/domain/repositories/notes_repository.dart';
import 'package:notes/modules/notes/domain/usecases/create_new_note.dart';
import 'create_new_note_test.mocks.dart';

@GenerateMocks([NotesRepository])
void main() {

  final repository = MockRealtimeDatabase();
  final usecase = CreateNewNoteImpl(repository);

  test('Should return true if note is created', () async {
    Note newNote = Note(title: 'title', content: 'content', color: 'color');
    final result = await usecase(newNote);
    expect(result, const Right(true));
  });

  test('Should return an exception when validanting note color', () async {
    Note newNote = Note(title: '', content: '', color: '');
    final result = await usecase(newNote);
    expect(result.leftMap((l) => l is FailureCreatingNewNote), const Left(true));
  });
}

