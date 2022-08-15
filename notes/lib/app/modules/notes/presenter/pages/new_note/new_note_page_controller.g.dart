// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_note_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewNotePageController on _NewNotePageControllerBase, Store {
  Computed<Note>? _$noteComputed;

  @override
  Note get note => (_$noteComputed ??= Computed<Note>(() => super.note,
          name: '_NewNotePageControllerBase.note'))
      .value;

  late final _$titleAtom =
      Atom(name: '_NewNotePageControllerBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$textAtom =
      Atom(name: '_NewNotePageControllerBase.text', context: context);

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  late final _$colorAtom =
      Atom(name: '_NewNotePageControllerBase.color', context: context);

  @override
  String get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(String value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  late final _$backgroundColorAtom = Atom(
      name: '_NewNotePageControllerBase.backgroundColor', context: context);

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

  late final _$_NewNotePageControllerBaseActionController =
      ActionController(name: '_NewNotePageControllerBase', context: context);

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_NewNotePageControllerBaseActionController
        .startAction(name: '_NewNotePageControllerBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_NewNotePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setText(String value) {
    final _$actionInfo = _$_NewNotePageControllerBaseActionController
        .startAction(name: '_NewNotePageControllerBase.setText');
    try {
      return super.setText(value);
    } finally {
      _$_NewNotePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setColor(String value) {
    final _$actionInfo = _$_NewNotePageControllerBaseActionController
        .startAction(name: '_NewNotePageControllerBase.setColor');
    try {
      return super.setColor(value);
    } finally {
      _$_NewNotePageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
text: ${text},
color: ${color},
backgroundColor: ${backgroundColor},
note: ${note}
    ''';
  }
}
