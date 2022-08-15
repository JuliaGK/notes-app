import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';
import '../errors/errors.dart';

abstract class NotesDatasource {
  Future<bool> createNote(Map note);
  Future<bool> updateNote(Map note);
  Future<bool> deleteNote(String id);
  Future<Map> getNote(String id);
  Future<Query> getNotesQuery();
}