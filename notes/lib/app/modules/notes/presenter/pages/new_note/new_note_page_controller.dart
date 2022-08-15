import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:notes/app/modules/notes/domain/usecases/create_new_note.dart';
import 'package:notes/app/modules/notes/presenter/utils/string_to_color.dart';

import '../../../domain/entities/note.dart';

part 'new_note_page_controller.g.dart';

@Injectable()
class NewNotePageController = _NewNotePageControllerBase with _$NewNotePageController;

abstract class _NewNotePageControllerBase with Store {
  
  final CreateNewNoteImpl createNewNoteImpl;

  _NewNotePageControllerBase(this.createNewNoteImpl);

  @observable
  String title = '';

  @action
  setTitle(String value) => title = value;

  @observable 
  String text = '';

  @action
  setText(String value) => text = value;

  @observable
  String color = 'white';

  @observable
  Color backgroundColor = Colors.white;

  @action
  setColor(String value) {
    color = value;
    backgroundColor = stringToColor(value)!;
  }

  @computed
  Note get note => Note(title: title, content:text, color: color);

  createNote() async {
    var result = await createNewNoteImpl.call(note);
    if(result.isLeft()){
       result.leftMap((l) => AsukaSnackbar.warning(l.message).show());
    } else {
      result.map((r) {
      Modular.to.navigate('/notes');
      });
    }
  }

}