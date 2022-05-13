import 'package:flutter/material.dart';

import 'package:zeldesk/core/constants/colors.dart';

class CustomIconButton2 extends StatefulWidget {
  final IconData icon;
  final String text;
  final AnimationController controller;
  final bool isDrawerClosed;
  final Color? color;

  CustomIconButton2(
      {required this.icon,
      required this.text,
      required this.controller,
      this.color,
      this.isDrawerClosed = false});

  @override
  State<CustomIconButton2> createState() => _CustomIconButton1State();
}

class _CustomIconButton1State extends State<CustomIconButton2> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: MouseRegion(
            onEnter: (event) {
              setState(() {
                isHovering = true;
              });
            },
            onExit: (event) {
              setState(() {
                isHovering = false;
              });
            },
            child: GestureDetector(
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  width: 190,
                  decoration: BoxDecoration(
                      color: isHovering ? klightbg : kdarkbg,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  padding: EdgeInsets.only(
                      top: 12,
                      bottom: 12,
                      left: widget.isDrawerClosed
                          ? 12
                          : isHovering
                              ? 20
                              : 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        maxRadius: 12,
                        backgroundColor: widget.color,
                        child: Icon(
                          widget.icon,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Opacity(
                        opacity: widget.controller.value,
                        child: Text(
                          widget.text,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  )),
            )));
  }
}
