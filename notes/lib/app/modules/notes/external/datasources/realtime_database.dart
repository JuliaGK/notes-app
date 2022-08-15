import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:notes/app/core/stores/auth_store.dart';
import 'package:notes/app/modules/authentication/domain/usecases/get_logged_user.dart';

import '../../../authentication/domain/entities/user.dart';
import '../../infra/datasources/notes_database.dart';

class RealtimeDatabase implements NotesDatasource {
  var authStore = Modular.get<AuthStore>();

  RealtimeDatabase();

  Future<DatabaseReference> getRef() async {
    User user = authStore.loggedUser;
    String uid = user.uid;

    DatabaseReference ref = FirebaseDatabase.instance.ref('users/$uid');
    if (ref.key == null) {
      await ref.set({
        uid: {'notes': {}}
      });
    }
    ref = FirebaseDatabase.instance.ref('users/$uid/notes');
    return ref;
  }

  @override
  Future<bool> createNote(Map note) async {
    var ref = await getRef();

    var newNoteId = ref.push().key;
    ref = ref.child(newNoteId!);
    await ref.set({
      "title": note['title'],
      "text": note['content'],
      "datetime_created": note['datetimeCreated'],
      "color": note['color']
    });
    return true;
  }

  @override
  Future<bool> deleteNote(String id) async {
    var ref = await getRef();
    await ref.child(id).remove();
    return true;
  }

  @override
  Future<Map> getNote(String id) async {
    var ref = await getRef();
    final snapshot = await ref.child(id).get();
    return snapshot.value as Map;
  }

  @override
  Future<Query> getNotesQuery() async {
    User user = authStore.loggedUser;
    String uid = user.uid;

    DatabaseReference ref = FirebaseDatabase.instance.ref('users/$uid');
    if (ref.key == null) {
      await ref.set({
        uid: {'notes': {}}
      });
    }
    var query = FirebaseDatabase.instance.ref('users/$uid/notes').orderByKey();
    return query;
  }

  @override
  Future<bool> updateNote(Map note) async {
    var ref = await getRef();
    ref = ref.child(note['id']);
    await ref.update({
      "title": note['title'],
      "text": note['content'],
      "color": note['color'],
      "datetime_created": note['datetimeCreated']
    });
    return true;
  }
}
