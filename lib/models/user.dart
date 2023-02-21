import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String username;
  final String email;
  final String mobileNumber;
  final String token;
  final String role;
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.mobileNumber,
    required this.token,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'mobileNumber': mobileNumber,
      'token': token,
      'role': role,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      mobileNumber: map['mobileNumber'] as String,
      token: map['token'] as String,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}