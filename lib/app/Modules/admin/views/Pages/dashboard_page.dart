import 'package:flutter/material.dart';
import 'package:zeldesk/app/Modules/admin/widgets/ticket_box.dart';

import 'package:zeldesk/core/constants/colors.dart';

class DashboardPage extends StatelessWidget {
  late Size _screen;

  @override
  Widget build(BuildContext context) {
    _screen = MediaQuery.of(context).size;
    return Container(
      height: _screen.height - 60,
      color: kdarkbg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   height: 60,
          //   color: klightbg,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [ProfileDropdown()],
          //   ),
          // ),
          //? BODY IS IMPLEMENTED HERE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Text(
              "Dashboard",
              style:
                  Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Wrap(
              children: [
                ticketBox(context, _screen, "Open ticket", "0"),
                const SizedBox(
                  width: 15,
                ),
                ticketBox(context, _screen, "Open ticket", "0"),
                const SizedBox(
                  width: 15,
                ),
                ticketBox(context, _screen, "Open ticket", "0"),
                const SizedBox(
                  width: 15,
                ),
                ticketBox(context, _screen, "Open ticket", "0"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
