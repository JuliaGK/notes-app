import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:notes/app/core/page/splash_screen_page.dart';
import 'package:notes/app/core/stores/auth_store.dart';

import 'modules/authentication/authentication_module.dart';
import 'modules/authentication/domain/usecases/get_logged_user.dart';
import 'modules/authentication/domain/usecases/log_out.dart';
import 'modules/authentication/external/datasources/authentication_database_impl.dart';
import 'modules/authentication/infra/repositories/authentication_repository_impl.dart';
import 'modules/notes/notes_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => AuthStore(i(), i())),
    Bind.factory((i) => GetLoggedUserImpl(i())),
    Bind.factory((i) => LogOutImpl(i())),
    Bind.singleton((i) => FirebaseAuth.instance),
    Bind.singleton((i) => AuthenticationDatabaseImpl(i())),
    Bind.factory((i) => AuthenticationRepositoryImpl(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => SplashScreenPage()),
    ModuleRoute('/login', module: AuthenticationModule()),
    ModuleRoute('/notes', module: NotesModule())
  ];
}