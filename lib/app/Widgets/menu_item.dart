import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:zeldesk/core/constants/colors.dart';

class MenuItem extends StatefulWidget {
  final String title;

  final VoidCallback enter;
  final bool isActive;

  MenuItem({
    Key? key,
    required this.title,
    required this.enter,
    required this.isActive,
  }) : super(key: key);

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            _isHover = true;
          });
        },
        onExit: (event) {
          setState(() {
            _isHover = false;
          });
        },
        child: Text(
          widget.title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: widget.isActive
                  ? faddedGreen
                  : _isHover
                      ? faddedGreen
                      : kGrey),
        ),
      ),
    );
  }
}
