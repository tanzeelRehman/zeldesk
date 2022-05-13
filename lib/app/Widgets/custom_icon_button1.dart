import 'package:flutter/material.dart';

import 'package:zeldesk/core/constants/colors.dart';

class CustomIconButton1 extends StatefulWidget {
  final IconData icon;
  final String text;
  final AnimationController controller;
  final VoidCallback ontap;

  CustomIconButton1(
      {required this.icon,
      required this.text,
      required this.controller,
      required this.ontap});

  @override
  State<CustomIconButton1> createState() => _CustomIconButton1State();
}

class _CustomIconButton1State extends State<CustomIconButton1> {
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
              onTap: widget.ontap,
              child: Container(
                  width: 190,
                  decoration: BoxDecoration(
                      color:
                          isHovering ? faddedGreen.withOpacity(0.1) : klightbg,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        widget.icon,
                        color: ktxtAndIconcolor,
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
                              .subtitle2!
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  )),
            )));
  }
}
