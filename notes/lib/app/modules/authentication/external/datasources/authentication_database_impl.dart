import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes/app/modules/authentication/infra/datasources/authentication_database.dart';

import '../../domain/entities/user.dart' as user_model;
import '../../domain/errors/errors.dart';

class AuthenticationDatabaseImpl implements AuthenticationDatabase {
  final FirebaseAuth _auth;

  AuthenticationDatabaseImpl(this._auth);

  @override
  Future<bool> changePassword(Map userCredentials) async {
    await _auth.sendPasswordResetEmail(email: userCredentials['email']);
    return true;
  }

  @override
  Future<user_model.User> getLoggedUser() async {
    var user = _auth.currentUser;
    if (user == null) {
      throw Left(FailureGettingLoggedUser(
          'Failure while getting logged user: user is null'));
    } else {
      user_model.User currentUser =
          user_model.User(email: user.email as String, uid: user.uid);
      return currentUser;
    }
  }

  @override
  Future<user_model.User> logIn(Map userCredentials) async {
    await _auth.signInWithEmailAndPassword(
        email: userCredentials['email'], password: userCredentials['password']);
    return await getLoggedUser();
  }

  @override
  Future<bool> logOut() async {
    await _auth.signOut();
    return true;
  }

  @override
  Future<user_model.User> signUp(Map userCredentials) async {
    var result = await _auth.createUserWithEmailAndPassword(
        email: userCredentials['email'], password: userCredentials['password']);
    user_model.User createdUser = user_model.User(
        email: result.user!.email as String, uid: result.user!.uid);
    return createdUser;
  }
}
