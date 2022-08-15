class User {
  final String email;
  final String uid;

  User({this.email = '', this.uid = ''});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'uid': uid
    };
  }

}
