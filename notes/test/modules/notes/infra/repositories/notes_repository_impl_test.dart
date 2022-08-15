import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notes/app/modules/notes/infra/datasources/notes_database.dart';
import 'package:notes/app/modules/notes/infra/repositories/notes_repository_impl.dart';

class NotesDatasourceMock extends Mock implements NotesDatasource {}

void main() {
  final datasource = NotesDatasourceMock();
  final repository = NotesRepositoryImpl(datasource);

  group('create new note', () async {
  });

}