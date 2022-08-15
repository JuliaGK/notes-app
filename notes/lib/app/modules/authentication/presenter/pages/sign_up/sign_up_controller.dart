import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:notes/app/modules/authentication/domain/usecases/sign_up.dart';

import '../../../../../core/stores/auth_store.dart';
import '../../../domain/entities/user_credentials.dart';

part 'sign_up_controller.g.dart';

@Injectable()
class SignUpController = _SignUpControllerControllerBase
    with _$SignUpController;

abstract class _SignUpControllerControllerBase with Store {
  final SignUpImpl signUpImpl;
  final AuthStore authStore;

  _SignUpControllerControllerBase(this.signUpImpl, this.authStore);

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

  signUp() async {
    var result = await signUpImpl.signUp(credential);
    if (result.isLeft()) {
      result.leftMap((l) => AsukaSnackbar.warning(l.message).show());
    } else {
      result.map((r) {
        authStore.setUser(r);
        AsukaSnackbar.success("Account created!").show();
        Modular.to.navigate('notes/');
      });
    }
  }
}
