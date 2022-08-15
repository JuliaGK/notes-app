import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:notes/app/modules/notes/domain/usecases/delete_note.dart';
import 'package:notes/app/modules/notes/domain/usecases/edit_existing_note.dart';
import 'package:notes/app/modules/notes/domain/usecases/get_note.dart';
import 'package:notes/app/modules/notes/presenter/utils/string_to_color.dart';

import '../../../domain/entities/note.dart';

part 'edit_note_page_controller.g.dart';

@Injectable()
class EditNotePageController = _EditNotePageControllerBase
    with _$EditNotePageController;

abstract class _EditNotePageControllerBase with Store {
  final EditExistingNoteImpl editExistingNoteImpl;
  final GetNoteImpl getNoteImpl;
  final DeleteNoteImpl deleteNoteImpl;

  _EditNotePageControllerBase(
      this.editExistingNoteImpl, this.getNoteImpl, this.deleteNoteImpl);

  @observable
  Note note = Note();

  @observable
  Color backgroundColor = Colors.white;

  @action
  setTitle(String value) => note.title = value;

  @action
  setText(String value) => note.content = value;

  @action
  setColor(String value) {
    note.color = value;
    backgroundColor = stringToColor(value)!;
  }

  @action
  setDatetime(String value) => note.datetimeCreated = value;

  @action
  setId(String value) => note.id = value;

  @action
  setNote(Note noteToEdit) => note = noteToEdit;

  editNote() async {
    var result = await editExistingNoteImpl.call(note);
    if (result.isLeft()) {
      result.leftMap((l) => AsukaSnackbar.warning(l.message).show());
    } else {
      Modular.to.navigate('/notes');
    }
  }

  removeNote() async {
    var result = await deleteNoteImpl.call(note.id);
    if (result.isLeft()) {
      result.leftMap((l) => AsukaSnackbar.warning(l.message).show());
    } else {
      Modular.to.navigate('/notes');
    }
  }
}
