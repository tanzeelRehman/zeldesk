import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zeldesk/app/Modules/admin/Models/agent_model.dart';

import 'package:zeldesk/app/Modules/admin/Models/employee_list_model.dart';
import 'package:zeldesk/app/data/Models/user_model.dart';
import 'package:zeldesk/app/data/Services/firebase/auth_services.dart';

import 'package:zeldesk/core/utils/password_generator.dart';

import '../../../data/Services/firebase/fireStore_service.dart';

class AdminPageConteroller extends GetxController {
  //! CREATE NEW USER
  Future<String> createNewUser({
    required String email,
    required String name,
  }) {
    const password = "ijaz007";
    // PasswordGenerator.generatePassword(letter: true);

    var result = AuthServices().createUserWithEmailAndPass(
        email: email,
        password: password,
        model: UserModel(
            email: email,
            name: name,
            isSelected: false,
            userType: selectedUserType.value,
            user_permissions: getPermissions()));

    return result;
  }

  //! DEFAULT PERMISSIONS
  //*==========================================================================
  var showPermissionsTab = false.obs;
  var adminPermissions = {
    "Create users": true,
    "Create department": true,
    "Manage users": false,
    "Manage departments": true,
    "create admin ticket": true,
  };
  var customerPermissions = {
    "Create a ticket": true,
    "Delete a ticket": true,
  };
  var employeePermissions = {
    "Resolve a ticket": true,
    "Delete a ticket": true,
    "Farward a ticket": true,
  };

  Map<String, bool>? getPermissions() {
    switch (selectedUserType.value) {
      case "Admin":
        return adminPermissions;

      case "Employee":
        return employeePermissions;

      case "Customer":
        return customerPermissions;
    }
    return null;
  }

  void changePermission(bool value, int index) {
    final key = getPermissions()!.keys.elementAt(index);

    getPermissions()![key] = value;

    update();
  }

  var selectedUserType = "Admin".obs;
  var userTypes = ["Admin", "Employee", "Customer"].obs;

  //! ADD DEPARTMENT
  //*==========================================================================

  //! DEPARTMENT DETAILS
  //*==========================================================================

  // var departments = <DepartmentModel>[
  //   DepartmentModel(name: "IT Department"),
  //   DepartmentModel(name: "HR Department"),
  //   DepartmentModel(name: "Electric Department"),
  //   DepartmentModel(name: "Software Department"),
  // ];

  //! AGENTS LIST
  //*==========================================================================

  var agentslist = <AgentModel>[
    AgentModel(
        name: "Tanzeel", email: "Tanzeel@gmail.com", post: "Admin", id: 1),
    AgentModel(name: "zelu", email: "zelu@gmail.com", post: "employee", id: 2),
    AgentModel(name: "zelu", email: "zelu@gmail.com", post: "employee", id: 3),
    AgentModel(name: "zelu", email: "zelu@gmail.com", post: "employee", id: 4),
    AgentModel(name: "zelu", email: "zelu@gmail.com", post: "employee", id: 5),
  ];

  void updateAgentsList(int oldIdex, int newIndex) {
    final agent = agentslist.removeAt(oldIdex);
    agentslist.insert(newIndex, agent);
    update();
  }
}
