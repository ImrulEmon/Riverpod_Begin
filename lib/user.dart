// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final String name;
  final String email;
  final String website;
  final String username;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.website,
    required this.username,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? website,
    String? username,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      website: website ?? this.website,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'website': website,
      'username': username,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      website: map['website'] as String,
      username: map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, website: $website, username: $username)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.website == website &&
        other.username == username;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        website.hashCode ^
        username.hashCode;
  }
}

final userRepositoryProvider = Provider(((ref) => UserRepository()));

class UserRepository extends StateNotifier<bool> {
  UserRepository() : super(false);

  Future<User> fetchUserData(String input) {
    var url = 'https://jsonplaceholder.typicode.com/users/$input';
    return http.get(Uri.parse(url)).then((value) => User.fromJson(value.body));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

// class UserNotifier extends StateNotifier<User> {
//   UserNotifier(super.state);
//   void updateName(String n) {
//     state = state.copyWith(name: n);
//   }

//   void updateAge(int a) {
//     state = state.copyWith(age: a);
//   }
// }

// class UserNotifierChange extends ChangeNotifier {
//   User user = User(name: '', age: 0);

//   void updateName(String n) {
//     user = user.copyWith(name: n);
//   }

//   void updateAge(int a) {
//     user = user.copyWith(age: a);
//   }
// }
