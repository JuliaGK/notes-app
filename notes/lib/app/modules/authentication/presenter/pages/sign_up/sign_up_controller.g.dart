// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpController on _SignUpControllerControllerBase, Store {
  Computed<UserCredentials>? _$credentialComputed;

  @override
  UserCredentials get credential => (_$credentialComputed ??=
          Computed<UserCredentials>(() => super.credential,
              name: '_SignUpControllerControllerBase.credential'))
      .value;

  late final _$emailAtom =
      Atom(name: '_SignUpControllerControllerBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_SignUpControllerControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$_SignUpControllerControllerBaseActionController =
      ActionController(
          name: '_SignUpControllerControllerBase', context: context);

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_SignUpControllerControllerBaseActionController
        .startAction(name: '_SignUpControllerControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpControllerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_SignUpControllerControllerBaseActionController
        .startAction(name: '_SignUpControllerControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignUpControllerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
credential: ${credential}
    ''';
  }
}
