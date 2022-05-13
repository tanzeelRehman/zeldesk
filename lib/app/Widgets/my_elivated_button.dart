import 'package:flutter/material.dart';
import 'package:zeldesk/core/constants/colors.dart';
import 'package:zeldesk/core/constants/styles.dart';

Widget myElivatedButton(String text, VoidCallback onPressed, double width,
    BuildContext context, double height, ButtonStyle style1, Color color) {
  return ElevatedButton(
    child: SizedBox(
        width: width,
        height: height,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: color),
        ))),
    onPressed: onPressed,
    style: style1,
  );
}
