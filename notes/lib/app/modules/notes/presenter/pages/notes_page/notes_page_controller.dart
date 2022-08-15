import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:notes/app/modules/authentication/domain/usecases/log_out.dart';
import 'package:notes/app/modules/notes/domain/usecases/get_notes_query.dart';

part 'notes_page_controller.g.dart';

@Injectable()
class NotesPageController = _NotesPageControllerBase with _$NotesPageController;

abstract class _NotesPageControllerBase with Store {

  final LogOutImpl logOutImpl;
  final GetNotesQueryImpl getNotesQueryImpl;

  _NotesPageControllerBase(this.logOutImpl, this.getNotesQueryImpl);

  signOut() async {
    var result = await logOutImpl.logOut();
    result.fold((failure) {
      AsukaSnackbar.warning(failure.message).show();
    }, (works) {
      Modular.to.pushReplacementNamed('/login');
      AsukaSnackbar.success("Logged out").show();
    });
  }

  Future<Query> getNotesQuery() async {
    var result = await getNotesQueryImpl.getNotesQuery();
    if(result.isLeft()){
      result.leftMap((l) {});
    } else {
      Query query = result.getOrElse(() => throw NullThrownError());
      return query;
    }
    throw NullThrownError();
  }

}