import 'package:flutter/material.dart';
import 'package:zeldesk/core/constants/colors.dart';

InputDecoration textfieldDecoration1 = InputDecoration(
  hintText: 'Enter email',
  filled: true,
  labelStyle: const TextStyle(fontSize: 12),
  contentPadding: const EdgeInsets.only(left: 30),
  errorMaxLines: 1,
  errorStyle: const TextStyle(color: Colors.red, fontSize: 15, height: 1),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(15),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.blueGrey),
    borderRadius: BorderRadius.circular(15),
  ),
);
InputDecoration textfieldDecoration2 = InputDecoration(
  fillColor: kdarkbg,
  filled: true,
  errorMaxLines: 1,
  errorStyle: const TextStyle(color: Colors.red, fontSize: 15, height: 1),
  labelStyle: const TextStyle(fontSize: 12),
  contentPadding: const EdgeInsets.only(left: 30),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(5),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: klightwhite.withOpacity(0.7)),
    borderRadius: BorderRadius.circular(8),
  ),
);

final elivatedButtonStyle = ElevatedButton.styleFrom(
  primary: faddedGreen,
  onPrimary: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
);

final elivatedButtonStyle2 = ElevatedButton.styleFrom(
  primary: faddedGreen,
  onPrimary: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
);
final redElivatedButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.red[300],
  onPrimary: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
);
final greenElivatedButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.green[300],
  onPrimary: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
);
final blueElivatedButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.green[300],
  onPrimary: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
);
final yellowElivatedButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.yellow[300],
  onPrimary: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
);
