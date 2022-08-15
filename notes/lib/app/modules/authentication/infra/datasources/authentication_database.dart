import '../../domain/entities/user.dart';

abstract class AuthenticationDatabase {
  Future<User> logIn(Map userCredentials);
  Future<User> signUp(Map userCredentials);
  Future<bool> changePassword(Map userCredentials);
  Future<User> getLoggedUser();
  Future<bool> logOut();
}
