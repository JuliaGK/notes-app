import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:notes/app/modules/authentication/domain/usecases/change_password.dart';
import 'package:notes/app/modules/authentication/domain/usecases/get_logged_user.dart';
import 'package:notes/app/modules/authentication/domain/usecases/log_in.dart';
import 'package:notes/app/modules/authentication/domain/usecases/sign_up.dart';
import 'package:notes/app/modules/authentication/infra/repositories/authentication_repository_impl.dart';
import 'package:notes/app/modules/authentication/presenter/pages/change_password/change_password_controller.dart';
import 'package:notes/app/modules/authentication/presenter/pages/change_password/change_password_page.dart';
import 'package:notes/app/modules/authentication/presenter/pages/login/login_controller.dart';
import 'package:notes/app/modules/authentication/presenter/pages/login/login_page.dart';
import 'package:notes/app/modules/authentication/presenter/pages/sign_up/sign_up_controller.dart';
import 'package:notes/app/modules/authentication/presenter/pages/sign_up/sign_up_page.dart';

import '../notes/notes_module.dart';
import 'domain/usecases/log_out.dart';
import 'external/datasources/authentication_database_impl.dart';

class AuthenticationModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => FirebaseAuth.instance),
        Bind.singleton((i) => AuthenticationDatabaseImpl(i())),
        Bind.factory((i) => AuthenticationRepositoryImpl(i())),
        Bind.factory((i) => ChangePasswordImpl(i())),
        Bind.factory((i) => GetLoggedUserImpl(i()), export: true),
        Bind.factory((i) => LogInImpl(i())),
        Bind.factory((i) => LogOutImpl(i()), export: true),
        Bind.factory((i) => SignUpImpl(i())),
        Bind.singleton((i) => LoginController(i(), i())),
        Bind.singleton((i) => ChangePasswordController(i())),
        Bind.singleton((i) => SignUpController(i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginPage()),
        ChildRoute('/change_password', child: (context, args) => const ChangePasswordPage()),
        ChildRoute('/sign_up', child: (context, args) => const SignUpPage()),
        ModuleRoute('/notes', module: NotesModule()),
      ];
}
