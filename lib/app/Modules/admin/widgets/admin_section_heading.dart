import 'package:flutter/material.dart';

Widget adminsectionHeading(
    BuildContext context, double top, double left, String text, double size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(top: top, left: left),
        child: Text(
          text,
          style:
              Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: size),
        ),
      ),
    ],
  );
}

Text adminSubheading(BuildContext context, String txt, double size) {
  return Text(
    txt,
    style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: size),
  );
}
