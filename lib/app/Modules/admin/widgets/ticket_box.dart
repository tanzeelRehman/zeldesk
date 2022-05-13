import 'package:flutter/material.dart';
import 'package:zeldesk/app/Widgets/custom_decroated_box.dart';

CustomDecorationBox ticketBox(
    BuildContext context, Size screen, String title, String numb) {
  return CustomDecorationBox(
    height: screen.height * 0.2,
    width: 220,
    margins: const EdgeInsets.symmetric(horizontal: 15),
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          numb,
          style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 40),
        )
      ],
    ),
  );
}
