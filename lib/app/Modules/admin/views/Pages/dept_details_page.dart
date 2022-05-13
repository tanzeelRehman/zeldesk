import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeldesk/app/Modules/admin/controller/admin_page_controller.dart';
import 'package:zeldesk/app/Modules/admin/widgets/admin_section_heading.dart';
import 'package:zeldesk/app/Widgets/custom_decroated_box.dart';
import 'package:zeldesk/app/Widgets/profile_dropdown.dart';

import 'package:zeldesk/core/constants/colors.dart';

class DepartmentDetails extends StatelessWidget {
  late Size _screen;
  final AdminPageConteroller adminPageConteroller =
      Get.find<AdminPageConteroller>();

  @override
  Widget build(BuildContext context) {
    _screen = MediaQuery.of(context).size;
    return Container(
      color: kdarkbg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //? NAVBAR  IS HERE
          Container(
            height: 60,
            color: klightbg,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              //TODO ADD DEPT DROPDOWN HERE
              // children: [ProfileDropDown(name: name, items: items)],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
            child: Column(
                children: List.generate(adminPageConteroller.departments.length,
                    (index) {
              return departmentRow(
                  context, adminPageConteroller.departments[index].name);
            })),
          )
        ],
      ),
    );
  }

  Card departmentRow(BuildContext context, String name) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.people_rounded,
          size: 50,
        ),
        isThreeLine: true,
        title: adminsectionHeading(context, 5, 0, name, 20),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: adminSubheading(context, "Click to see all agents", 15),
        ),
      ),
    );
  }
}
