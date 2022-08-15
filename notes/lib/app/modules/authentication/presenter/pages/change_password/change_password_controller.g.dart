// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangePasswordController on _ChangePasswordControllerBase, Store {
  Computed<UserCredentials>? _$credentialComputed;

  @override
  UserCredentials get credential => (_$credentialComputed ??=
          Computed<UserCredentials>(() => super.credential,
              name: '_ChangePasswordControllerBase.credential'))
      .value;

  late final _$emailAtom =
      Atom(name: '_ChangePasswordControllerBase.email', context: context);

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

  late final _$_ChangePasswordControllerBaseActionController =
      ActionController(name: '_ChangePasswordControllerBase', context: context);

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_ChangePasswordControllerBaseActionController
        .startAction(name: '_ChangePasswordControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_ChangePasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
credential: ${credential}
    ''';
  }
}
