class UserCredentials {
  late final String email;
  late final String password;

  UserCredentials({this.email = '', this.password = ''});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password
    };
  }

}
