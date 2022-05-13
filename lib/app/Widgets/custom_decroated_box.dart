import 'package:flutter/material.dart';
import 'package:zeldesk/core/constants/colors.dart';

class CustomDecorationBox extends StatelessWidget {
  const CustomDecorationBox(
      {Key? key,
      required this.child,
      this.width,
      this.margins,
      this.padding,
      this.height})
      : super(key: key);
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? margins;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: klightwhite.withOpacity(0.5),
              blurRadius: 2,
              spreadRadius: 1)
        ],
        color: klightbg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
