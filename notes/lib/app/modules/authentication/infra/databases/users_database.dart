abstract class UserDatabases {
  Future<bool> signInUser();
  Future<bool> changePassword();
  Future<bool> signOutUser();
  Future<bool> signUpUser();
}