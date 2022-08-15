import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:notes/app/core/stores/auth_store.dart';
import 'package:notes/app/modules/authentication/domain/entities/user_credentials.dart';
import 'package:notes/app/modules/authentication/domain/usecases/log_in.dart';

import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LogInImpl logInImpl;
  final AuthStore authStore;

  _LoginControllerBase(this.logInImpl, this.authStore);

  @observable
  String email = '';

  @action
  setEmail(String value) => email = value;

  @observable
  String password = '';

  @action
  setPassword(String value) => password = value;

  @computed
  UserCredentials get credential =>
      UserCredentials(email: email, password: password);

  enterEmail() async {
    var result = await logInImpl.logIn(credential);
    if (result.isLeft()) {
      result.leftMap((l) => AsukaSnackbar.warning(l.message).show());
    } else {
      result.map((r) {
        authStore.setUser(r);
        Modular.to.navigate('notes/');
      });
    }
  }
}
