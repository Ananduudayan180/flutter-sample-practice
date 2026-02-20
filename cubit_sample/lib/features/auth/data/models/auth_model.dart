class AuthModel {
  final String? name;
  final String email;
  final String pass;

  AuthModel({required this.name, required this.email, required this.pass});

  factory AuthModel.fromJson(Map json) {
    return AuthModel(
      name: json['name'],
      email: json['email'],
      pass: json['pass'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'pass': pass};
  }
}
