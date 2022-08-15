import 'package:asuka/asuka.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:notes/app/modules/authentication/domain/usecases/change_password.dart';

import '../../../domain/entities/user_credentials.dart';

part 'change_password_controller.g.dart';

@Injectable()
class ChangePasswordController = _ChangePasswordControllerBase with _$ChangePasswordController;

abstract class _ChangePasswordControllerBase with Store {
  final ChangePasswordImpl changePasswordImpl;

  _ChangePasswordControllerBase(this.changePasswordImpl);

  @observable
  String email = '';

  @action
  setEmail(String value) => email = value;

  @computed
  UserCredentials get credential =>
    UserCredentials(email: email);

  changePassword() async {
    var result = await changePasswordImpl.changePassword(credential);
    result.fold((failure) {
      AsukaSnackbar.warning(failure.message).show();
    }, (works) {
      AsukaSnackbar.success("Message sent").show();
    });
  }

}