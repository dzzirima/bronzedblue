import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String username;
  final String email;
  final String password;
  final String mobileNumber;
  final String token;
  final String role;
  User({
    required this.username,
    required this.email,
    required this.password,
    required this.mobileNumber,
    required this.token,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
      'mobileNumber': mobileNumber,
      'token': token,
      'role': role,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] ?? '',
      mobileNumber: map['mobileNumber'] ?? '',
      token: map['token'] ?? '',
      role: map['role'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
