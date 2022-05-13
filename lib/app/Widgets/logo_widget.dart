import 'package:flutter/material.dart';
import 'package:zeldesk/core/constants/colors.dart';

Container logoWidget(double width, double height, double fontsize) {
  double radius = width / 2;
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
            colors: [faddedGreen, brightGreen],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft)),
    child: Center(
      child:
          Text("Z", style: TextStyle(fontSize: fontsize, color: Colors.white)),
    ),
  );
}
