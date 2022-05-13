import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class ProfileDropDown extends StatelessWidget {
  final String name;
  final List<PopupMenuItem> items;

  ProfileDropDown({
    required this.name,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        openPopupMenu(
            context: context,
            items: items,
            bottom: 0,
            top: 60,
            left: details.globalPosition.distance,
            right: 40);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: faddedGreen,
              child: Text(
                name[0],
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              name,
              style:
                  Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  //*===================================================
  //? FUNCTION WHICH WILL DISPLAY ALL DROP DOWN BUTTONS
  //*===================================================
  Future<void> openPopupMenu(
      {required BuildContext context,
      required List<PopupMenuItem> items,
      double top = 0,
      double bottom = 0,
      double left = 0,
      double right = 0}) async {
    await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(left, top, right, bottom),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        items: items);
  }
}
