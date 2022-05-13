import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

Widget singlePopupMenuItem(
    {required IconData icon,
    required String text,
  }) {
  return Row(
    children: [
      Icon(
        icon,
        color: faddedGreen,
      ),
      const SizedBox(
        width: 15,
      ),
      Text(text),
    ],
  );
}
