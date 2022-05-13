import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zeldesk/app/Modules/admin/controller/admin_page_controller.dart';
import 'package:zeldesk/app/Modules/admin/widgets/admin_section_heading.dart';
import 'package:zeldesk/app/Widgets/custom_decroated_box.dart';
import 'package:zeldesk/app/Widgets/profile_dropdown.dart';
import 'package:zeldesk/core/constants/colors.dart';

class DepartmentAgents extends StatelessWidget {
  late Size _screen;

  @override
  Widget build(BuildContext context) {
    _screen = MediaQuery.of(context).size;
    return Container(
      color: kdarkbg,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //? NAVBAR  IS HERE
            Container(
                height: 60,
                color: klightbg,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //TODO ADD DEPT DROPDOWN HERE
                  // children: [ProfileDropDown(name: name, items: items)],
                )),
            const SizedBox(
              height: 40,
            ),

            GetBuilder<AdminPageConteroller>(builder: (adminPageConteroller) {
              return SizedBox(
                height: _screen.height * 0.8,
                child: ReorderableListView.builder(
                    header: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: adminsectionHeading(context, 0, 0,
                          "Grab the icon to reorder the agents", 20),
                    ),
                    buildDefaultDragHandles: true,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    itemBuilder: (context, index) {
                      return SizedBox(
                          key: Key(index.toString()),
                          child: AgentRow(
                            conteroller: adminPageConteroller,
                            index: index,
                          ));
                    },
                    itemCount: adminPageConteroller.agentslist.length,
                    onReorder: (oldIndex, newIndex) {
                      adminPageConteroller.updateAgentsList(oldIndex, newIndex);
                    }),
              );
            }),

            const SizedBox(
              height: 15,
            ),
          ]),
    );
  }
}

class AgentRow extends StatelessWidget {
  final AdminPageConteroller conteroller;
  final int index;
  const AgentRow({
    Key? key,
    required this.conteroller,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: klightbg,
      child: ListTile(
        key: ValueKey(conteroller.agentslist[index].id),
        leading: Text(conteroller.agentslist[index].id.toString()),
        title: Text(conteroller.agentslist[index].name),
        subtitle: Text(conteroller.agentslist[index].email),
      ),
    );
  }
}
