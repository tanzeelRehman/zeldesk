import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  String? id;
  final String name;
  final String userType;
  String? inDept;
  Map<String, bool>? user_permissions;
  UserModel({
    this.id,
    required this.name,
    required this.userType,
    this.user_permissions,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? userType,
    Map<String, bool>? user_permissions,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      userType: userType ?? this.userType,
      user_permissions: user_permissions ?? this.user_permissions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userType': userType,
      'user_permissions': user_permissions,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'] ?? '',
      userType: map['userType'] ?? '',
      user_permissions: Map<String, bool>.from(map['user_permissions']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, userType: $userType, user_permissions: $user_permissions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.userType == userType &&
        mapEquals(other.user_permissions, user_permissions);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        userType.hashCode ^
        user_permissions.hashCode;
  }
}
