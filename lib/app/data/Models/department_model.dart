import 'dart:convert';

import 'package:flutter/foundation.dart';

class DepartmentModel {
  String departmentName;
  List<String> departmentEmployees;
  DepartmentModel({
    required this.departmentName,
    required this.departmentEmployees,
  });

  DepartmentModel copyWith({
    String? departmentName,
    List<String>? departmentEmployees,
  }) {
    return DepartmentModel(
      departmentName: departmentName ?? this.departmentName,
      departmentEmployees: departmentEmployees ?? this.departmentEmployees,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'departmentName': departmentName,
      'departmentEmployees': departmentEmployees,
    };
  }

  factory DepartmentModel.fromMap(Map<String, dynamic> map) {
    return DepartmentModel(
      departmentName: map['departmentName'] ?? '',
      departmentEmployees: List<String>.from(map['departmentEmployees']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DepartmentModel.fromJson(String source) =>
      DepartmentModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'DepartmentModel(departmentName: $departmentName, departmentEmployees: $departmentEmployees)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DepartmentModel &&
        other.departmentName == departmentName &&
        listEquals(other.departmentEmployees, departmentEmployees);
  }

  @override
  int get hashCode => departmentName.hashCode ^ departmentEmployees.hashCode;
}
