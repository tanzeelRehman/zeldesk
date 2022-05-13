import 'package:flutter/material.dart';
import 'package:zeldesk/core/constants/colors.dart';

Padding horizentalLine(double verticalpadding) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: verticalpadding),
    child: Container(
      height: 2,
      color: kdarkbg,
      width: double.infinity,
    ),
  );
}
