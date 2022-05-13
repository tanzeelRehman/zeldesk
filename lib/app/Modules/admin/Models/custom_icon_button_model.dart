import 'package:flutter/cupertino.dart';

class CustomIconButtonModel {
  String text;
  IconData icon;
  Color? color;
  VoidCallback ontap;
  CustomIconButtonModel({
    required this.text,
    required this.icon,
    this.color,
    required this.ontap,
  });
}
