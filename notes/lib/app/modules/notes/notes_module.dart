import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:notes/app/modules/authentication/domain/usecases/get_logged_user.dart';
import 'package:notes/app/modules/authentication/external/datasources/authentication_database_impl.dart';
import 'package:notes/app/modules/authentication/infra/repositories/authentication_repository_impl.dart';
import 'package:notes/app/modules/notes/domain/usecases/create_new_note.dart';
import 'package:notes/app/modules/notes/domain/usecases/delete_note.dart';
import 'package:notes/app/modules/notes/domain/usecases/edit_existing_note.dart';
import 'package:notes/app/modules/notes/domain/usecases/get_note.dart';
import 'package:notes/app/modules/notes/domain/usecases/get_notes_query.dart';
import 'package:notes/app/modules/notes/external/datasources/realtime_database.dart';
import 'package:notes/app/modules/notes/presenter/pages/edit_note/edit_note_page_controller.dart';
import 'package:notes/app/modules/notes/presenter/pages/edit_note/edit_note_page.dart';
import 'package:notes/app/modules/notes/presenter/pages/new_note/new_note_page.dart';
import 'package:notes/app/modules/notes/presenter/pages/new_note/new_note_page_controller.dart';
import 'package:notes/app/modules/notes/presenter/pages/notes_page/notes_page.dart';
import 'package:notes/app/modules/notes/presenter/pages/notes_page/notes_page_controller.dart';
import 'infra/repositories/notes_repository_impl.dart';

class NotesModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => RealtimeDatabase()),
    Bind.singleton((i) => FirebaseAuth.instance),
    Bind.singleton((i) => AuthenticationDatabaseImpl(i())),
    Bind.singleton((i) => AuthenticationRepositoryImpl(i())),
    Bind.factory((i) => GetLoggedUserImpl(i())),
    Bind.singleton((i) => NotesRepositoryImpl(i())),
    Bind.factory((i) => CreateNewNoteImpl(i())),
    Bind.factory((i) => DeleteNoteImpl(i())),
    Bind.factory((i) => EditExistingNoteImpl(i())),
    Bind.factory((i) => GetNoteImpl(i())),
    Bind.factory((i) => GetNotesQueryImpl(i())),
    Bind.factory((i) => NotesPageController(i(), i())),
    Bind.factory((i) => NewNotePageController(i())),
    Bind.singleton((i) => EditNotePageController(i(), i(), i()))

  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const NotesPage()),
    ChildRoute('/new_note', child: (context, args) => const NewNotePage()),
    ChildRoute('/edit_note', child: (context, args) => EditNotePage(note: args.data)),


  ];
}
