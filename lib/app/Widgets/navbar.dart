import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeldesk/app/Modules/CustomerPortal/controller/customer_controller.dart';

import 'package:zeldesk/app/Widgets/logo_widget.dart';
import 'package:zeldesk/app/Widgets/profile_dropdown.dart';

import 'package:zeldesk/core/constants/colors.dart';

class CustomAppbar extends StatelessWidget {
  final CustomerController _controller = Get.find<CustomerController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.only(top: 10, right: 50),
              child: ProfileDropDown(
                name: _controller.getCustomerName,
                items: _controller.popupItems,
              ))
        ],
        backgroundColor: klightbg,
        shadowColor: klightwhite.withOpacity(0.5),
        elevation: 0.7,
        leadingWidth: 400,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Row(
            children: [
              logoWidget(37, 37, 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "ZDESK",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: 25),
                ),
              ),
            ],
          ),
        ));
  }
}
