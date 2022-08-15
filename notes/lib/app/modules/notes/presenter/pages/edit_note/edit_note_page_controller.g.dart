// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_note_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditNotePageController on _EditNotePageControllerBase, Store {
  late final _$noteAtom =
      Atom(name: '_EditNotePageControllerBase.note', context: context);

  @override
  Note get note {
    _$noteAtom.reportRead();
    return super.note;
  }

  @override
  set note(Note value) {
    _$noteAtom.reportWrite(value, super.note, () {
      super.note = value;
    });
  }

  late final _$backgroundColorAtom = Atom(
      name: '_EditNotePageControllerBase.backgroundColor', context: context);

  @override
  Color get backgroundColor {
    _$backgroundColorAtom.reportRead();
    return super.backgroundColor;
  }

  @override
  set backgroundColor(Color value) {
    _$backgroundColorAtom.reportWrite(value, super.backgroundColor, () {
      super.backgroundColor = value;
    });
  }

  late final _$_EditNotePageControllerBaseActionController =
      ActionController(name: '_EditNotePageControllerBase', context: context);

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_EditNotePageControllerBaseActionController
        .startAction(name: '_EditNotePageControllerBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_EditNotePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setText(String value) {
    final _$actionInfo = _$_EditNotePageControllerBaseActionController
        .startAction(name: '_EditNotePageControllerBase.setText');
    try {
      return super.setText(value);
    } finally {
      _$_EditNotePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setColor(String value) {
    final _$actionInfo = _$_EditNotePageControllerBaseActionController
        .startAction(name: '_EditNotePageControllerBase.setColor');
    try {
      return super.setColor(value);
    } finally {
      _$_EditNotePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDatetime(String value) {
    final _$actionInfo = _$_EditNotePageControllerBaseActionController
        .startAction(name: '_EditNotePageControllerBase.setDatetime');
    try {
      return super.setDatetime(value);
    } finally {
      _$_EditNotePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setId(String value) {
    final _$actionInfo = _$_EditNotePageControllerBaseActionController
        .startAction(name: '_EditNotePageControllerBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_EditNotePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNote(Note noteToEdit) {
    final _$actionInfo = _$_EditNotePageControllerBaseActionController
        .startAction(name: '_EditNotePageControllerBase.setNote');
    try {
      return super.setNote(noteToEdit);
    } finally {
      _$_EditNotePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
note: ${note},
backgroundColor: ${backgroundColor}
    ''';
  }
}
