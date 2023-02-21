// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserFromApi {
  final String email;
  final String name;
  final String inputter;

  UserFromApi(this.email, this.name, this.inputter);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'inputter': inputter,
    };
  }

  factory UserFromApi.fromMap(Map<String, dynamic> map) {
    return UserFromApi(
      map['email'] as String,
      map['name'] as String,
      map['inputter'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserFromApi.fromJson(String source) =>
      UserFromApi.fromMap(json.decode(source) as Map<String, dynamic>);
}
