class User {
  final int? id;
  final String username;
  final String email;
  final String password;

  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });



  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'username': username,
        'email': email,
        'password': password, // Notez : Le mot de passe doit être haché

      };

  factory User.fromJson(Map<String, dynamic> json) =>
      User(
          id: json['id'],
          username: json['username'],
          email: json['email'],
          password: json['password']
      );

 /* Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'password': password, // Notez : Le mot de passe doit être haché
    };
  }
*/
}


