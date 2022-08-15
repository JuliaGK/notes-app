import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:notes/app/modules/authentication/domain/usecases/get_logged_user.dart';
import 'package:notes/app/modules/authentication/domain/usecases/log_out.dart';

import '../../modules/authentication/domain/entities/user.dart';

part 'auth_store.g.dart';

@Injectable()
class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final GetLoggedUserImpl loggedUserUsecase;
  final LogOutImpl logOutUsecase;

  _AuthStoreBase(this.loggedUserUsecase, this.logOutUsecase);

  @observable
  User loggedUser = User();

  @computed
  bool get isLogged => loggedUser.email != '';

  @action
  void setUser(User value) => loggedUser = value;

  Future<bool> checkLogin() async {
    var result = await loggedUserUsecase.getLoggedUser();
    if (result.isLeft()) {
      return false;
    } else {
      result.map((r) => setUser(r));
      return true;
    }
  }

  Future signOut() async {
    var result = await logOutUsecase.logOut();
    if (result.isRight()) {
      setUser(User());
    }
  }
}
