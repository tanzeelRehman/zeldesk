import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'package:zeldesk/app/Modules/CustomerPortal/controller/customer_controller.dart';

import 'package:zeldesk/app/Modules/admin/widgets/hr_line.dart';
import 'package:zeldesk/app/Widgets/custom_animated_dialogs.dart';
import 'package:zeldesk/app/Widgets/custom_decroated_box.dart';
import 'package:zeldesk/app/Widgets/my_elivated_button.dart';
import 'package:zeldesk/app/Widgets/navbar.dart';
import 'package:zeldesk/app/data/Models/complaint_model.dart';
import 'package:zeldesk/core/constants/colors.dart';
import 'package:zeldesk/core/constants/styles.dart';

import '../../../Widgets/custom_paginated_table.dart';
import '../../../Widgets/singlePopupMenuItem.dart';

class CustomerPortalpage extends StatelessWidget {
  late Size screen;

  var rowsPerPage = 5;

  final TextEditingController _subject = TextEditingController();

  final TextEditingController _description = TextEditingController();

  final CustomerController _controller = Get.find<CustomerController>();

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    print("in build widget");

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: CustomAppbar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: kdarkbg,
          child: Padding(
            padding: const EdgeInsets.only(left: 70, right: 70, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My tickets",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontSize: 30),
                    ),
                    _controller.getCreateTicketPermission() == true
                        ? myElivatedButton("New ticket", () {
                            CustomAnimatedDialogs.slideFromRight(
                                AlertDialog(
                                  title: const Text("Add a new ticket"),
                                  content: Container(
                                    width: screen.width * 0.3,
                                    height: screen.height * 0.45,
                                    child: Column(
                                      children: [
                                        TextField(
                                          controller: _subject,
                                          decoration: textfieldDecoration2
                                              .copyWith(hintText: "Subject"),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 200,
                                          child: TextField(
                                            controller: _description,
                                            textAlign: TextAlign.start,
                                            textAlignVertical:
                                                TextAlignVertical.top,
                                            scrollPadding: EdgeInsets.all(15),
                                            expands: true,
                                            maxLines: null,
                                            decoration:
                                                textfieldDecoration2.copyWith(
                                                    hintText:
                                                        "Detail description of the ticket",
                                                    contentPadding:
                                                        const EdgeInsets.all(
                                                            20)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        myElivatedButton("Cancel", () {
                                          Navigator.pop(context);
                                        }, 100, context, 40,
                                            elivatedButtonStyle2, kdarkbg),
                                        myElivatedButton("Conform", () async {
                                          var res = await _controller
                                              .createNewComplaint(
                                                  subject: _subject.text,
                                                  description:
                                                      _description.text);

                                          Navigator.pop(context);
                                        }, 100, context, 40,
                                            elivatedButtonStyle2, kdarkbg),
                                      ],
                                    ),
                                  ],
                                ),
                                context);
                          }, 70, context, 40, elivatedButtonStyle, Colors.white)
                        : Text(
                            "You are not allowed to Create a Ticket",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(color: Colors.red),
                          ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Material(
                  color: klightbg,
                  elevation: 2.0,
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    width: double.infinity,
                    height: screen.height * 0.81,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 200,
                                    height: 35,
                                    child: TextField(
                                      decoration: textfieldDecoration2.copyWith(
                                          prefixIcon: Icon(Icons.search),
                                          hintText: "Search"),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              horizentalLine(0.0),
                              buildHeadingRow(context),
                              horizentalLine(0.0),
                              GetBuilder<CustomerController>(
                                  builder: (controller) {
                                return controller.isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : SizedBox(
                                        height: screen.height * 0.60,
                                        child: ListView.builder(
                                            itemCount:
                                                _controller.getlist().length,
                                            itemBuilder: (context, index) {
                                              return CustomDataRow(
                                                complaint:
                                                    controller.getlist()[index],
                                                controller: controller,
                                              );
                                            }),
                                      );
                              })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildHeadingRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "COMPLAINT SUMMARY",
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(fontSize: 12, letterSpacing: 1),
          ),
          Row(
            children: [
              Text("CREATED AT",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 12, letterSpacing: 1)),
              const SizedBox(
                width: 45,
              ),
              Text("DEPARTMENT",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 12, letterSpacing: 1)),
              const SizedBox(
                width: 45,
              ),
              Text("STATUS",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 12, letterSpacing: 1)),
              const SizedBox(
                width: 45,
              ),
              Text("ACTION",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 12, letterSpacing: 1)),
            ],
          )
        ],
      ),
    );
  }
}

class CustomDataRow extends StatelessWidget {
  final ComplaintModel complaint;
  final CustomerController controller;
  const CustomDataRow({
    Key? key,
    required this.complaint,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                complaint.subject,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              Container(
                width: 500,
                //! ADD EXPANDED HERE
                child: Text(complaint.description,
                    overflow: TextOverflow.visible,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 12, letterSpacing: 1)),
              )
            ],
          ),
          Row(
            children: [
              Text(complaint.created_at.toIso8601String(),
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: 12, letterSpacing: 1)),
              const SizedBox(
                width: 45,
              ),
              Text(complaint.department ?? "Un assigned",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: 12, letterSpacing: 1)),
              const SizedBox(
                width: 45,
              ),
              Text(complaint.status,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: 12, letterSpacing: 1)),
              const SizedBox(
                width: 45,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        print(controller.isLoading);
                        print(complaint.complaint_id);
                        if (controller.getDeleteTicketPermission() == true) {
                          controller.deleteComplaint(complaint.complaint_id!);
                        }
                        print("Cant Do that");
                      },
                      icon: Icon(Icons.delete)),
                  //! ADD UPDATE TICKET
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
