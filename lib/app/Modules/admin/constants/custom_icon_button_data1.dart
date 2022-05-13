import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zeldesk/app/Modules/admin/Models/custom_icon_button_model.dart';
import 'package:zeldesk/core/constants/controllers_instances.dart';
import 'package:zeldesk/routes/routes.dart';

List<CustomIconButtonModel> customIconButtonData1 = [
  CustomIconButtonModel(
      text: "Dashboard",
      icon: Icons.dashboard_outlined,
      ontap: () => localNavigator.navigateTo(Routes.DASHBOARD)),
  CustomIconButtonModel(
      text: "Home",
      icon: Icons.home_outlined,
      ontap: () => localNavigator.navigateTo(Routes.TICKETS)),
];
List<CustomIconButtonModel> customIconButtonData2 = [
  CustomIconButtonModel(
      text: "Add User",
      icon: Icons.people,
      color: Colors.red,
      ontap: () => localNavigator.navigateTo(Routes.CREATE_USER)),
  CustomIconButtonModel(
      text: "Add Departmenet",
      icon: Icons.apartment,
      color: Colors.green,
      ontap: () => localNavigator.navigateTo(Routes.CREATE_DEPT)),
  CustomIconButtonModel(
    text: "User Details",
    icon: Icons.people,
    color: Colors.blue,
    ontap: () => localNavigator.navigateTo(Routes.DEPT_AGENTS),
  ),
  CustomIconButtonModel(
      text: "Department Details",
      icon: Icons.people,
      color: Colors.blue,
      ontap: () => localNavigator.navigateTo(Routes.DEPT_DETAILS)),
  CustomIconButtonModel(
      text: "Department Agents",
      icon: Icons.people,
      color: Colors.blue,
      ontap: () => localNavigator.navigateTo(Routes.DEPT_AGENTS)),
];
