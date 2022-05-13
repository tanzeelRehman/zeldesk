import 'package:flutter/material.dart';
import 'package:zeldesk/core/constants/colors.dart';

Widget highlightedButton({required VoidCallback function, required title}) {
  bool _isHovered = false;
  return InkWell(
    onTap: function,
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    onHover: (value) {
      _isHovered = false;
    },
    child: Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [faddedGreen, brightGreen],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: _isHovered
                    ? const Color(0xFF08A265).withOpacity(.3)
                    : const Color(0xFF08A265).withOpacity(0),
                offset: const Offset(0, 8),
                blurRadius: 16)
          ]),
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 1,
                  fontFamily: "Montserrat-Bold")),
        ),
      ),
    ),
  );
}
