import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  String? id;
  final String name;
  final String userType;
  final String email;
  String? inDept;
  Map<String, bool>? user_permissions;
  bool isSelected;
  UserModel({
    this.id,
    required this.name,
    required this.userType,
    required this.email,
    this.inDept,
    this.user_permissions,
    required this.isSelected,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? userType,
    String? email,
    String? inDept,
    Map<String, bool>? user_permissions,
    bool? isSelected,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      userType: userType ?? this.userType,
      email: email ?? this.email,
      inDept: inDept ?? this.inDept,
      user_permissions: user_permissions ?? this.user_permissions,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'userType': userType,
      'email': email,
      'inDept': inDept,
      'user_permissions': user_permissions,
      'isSelected': isSelected,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'] ?? '',
      userType: map['userType'] ?? '',
      email: map['email'] ?? '',
      inDept: map['inDept'],
      user_permissions: Map<String, bool>.from(map['user_permissions']),
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, userType: $userType, email: $email, inDept: $inDept, user_permissions: $user_permissions, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.userType == userType &&
        other.email == email &&
        other.inDept == inDept &&
        mapEquals(other.user_permissions, user_permissions) &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        userType.hashCode ^
        email.hashCode ^
        inDept.hashCode ^
        user_permissions.hashCode ^
        isSelected.hashCode;
  }
}
