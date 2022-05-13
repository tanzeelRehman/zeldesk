import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zeldesk/app/Modules/admin/controller/admin_page_controller.dart';
import 'package:zeldesk/app/Modules/admin/widgets/admin_page_textfield.dart';
import 'package:zeldesk/app/Modules/admin/widgets/admin_section_heading.dart';
import 'package:zeldesk/app/Modules/admin/widgets/hr_line.dart';
import 'package:zeldesk/app/Modules/admin/widgets/ticket_box.dart';
import 'package:zeldesk/app/Widgets/custom_decroated_box.dart';
import 'package:zeldesk/app/Widgets/my_elivated_button.dart';
import 'package:zeldesk/app/Widgets/profile_dropdown.dart';
import 'package:zeldesk/app/Widgets/custom_dialog.dart';
import 'package:zeldesk/core/constants/colors.dart';
import 'package:zeldesk/core/constants/styles.dart';
import 'package:zeldesk/core/utils/password_generator.dart';

class CreateUserPage extends StatelessWidget {
  late Size _screen;

  final TextEditingController emailText = TextEditingController();
  final TextEditingController nameText = TextEditingController();
  final TextEditingController passText = TextEditingController();

  final AdminPageConteroller adminPageConteroller =
      Get.find<AdminPageConteroller>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _screen = MediaQuery.of(context).size;

    void createNewUser() async {
      if (_formKey.currentState!.validate()) {
        var result = await adminPageConteroller.createNewUser(
          email: emailText.text,
          name: nameText.text,
        );
        if (result == "Sucess") {
          showDialog(
              context: context,
              builder: (context) {
                return CustomDialog(
                  decription: "Added Sucessfully",
                  isError: false,
                  isSucess: true,
                  onPressed: () {
                    Get.back();
                  },
                );
              });
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return CustomDialog(
                  decription: result.toString(),
                  isError: true,
                  onPressed: () {
                    Get.back();
                  },
                );
              });
        }
      }
    }

    return Obx(() => Container(
          color: kdarkbg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //? NAVBAR  IS HERE
              Container(
                height: 60,
                color: klightbg,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //TODO ADD CREATE USER DROPDOWN HERE
                  // children: [ProfileDropDown(name: name, items: items)],
                ),
              ),
              //? MAIN SECTION HEADING
              adminsectionHeading(context, 10, 40, "Create a new user", 30),
              //? MAIN SECTION
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: CustomDecorationBox(
                    width: _screen.width * 0.8,
                    height: adminPageConteroller.showPermissionsTab.value
                        ? _screen.height * 0.7
                        : _screen.height * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //* MAIN SECTION ROW 1ST
                        //?==========================================
                        Form(
                          key: _formKey,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  adminsectionHeading(
                                      context, 0, 0, "User details", 20)
                                ],
                              ),
                              SizedBox(
                                width: 630,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //* INPUT FIELDS
                                    Row(
                                      children: [
                                        AdminPageTextField(
                                          controller: nameText,
                                          hint: "Enter name",
                                          obsecureText: false,
                                          validator: (p0) {
                                            if (p0!.isEmpty) {
                                              return 'Please enter name';
                                            }
                                            return null;
                                          },
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        AdminPageTextField(
                                          controller: emailText,
                                          hint: "Enter email",
                                          obsecureText: false,
                                          validator: (p0) {
                                            if (p0!.isEmpty) {
                                              return 'Please enter email';
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        customDropDownButton(context),
                                      ],
                                    ),
                                    const SizedBox(height: 12),

                                    adminsectionHeading(
                                        context, 20, 30, "User details", 10),

                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: customSwitch(),
                                        ),
                                        adminSubheading(
                                            context,
                                            "You can change the default permissions by turnning off the switch button",
                                            10)
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        horizentalLine(20),
                        //* MAIN SECTION ROW 2nd
                        //? ROW SECOND STARTS FROM HERE/////////////////////
                        if (adminPageConteroller.showPermissionsTab.value)
                          Column(
                            children: [
                              adminsectionHeading(
                                  context, 0, 0, "User permissions", 20),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      for (var i = 0;
                                          i <
                                              adminPageConteroller
                                                  .getPermissions()!
                                                  .length;
                                          i++)
                                        customPermissionWidget(
                                            adminPageConteroller
                                                .getPermissions()!
                                                .keys
                                                .elementAt(i),
                                            context,
                                            adminPageConteroller
                                                .getPermissions()!
                                                .values
                                                .elementAt(i),
                                            i),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),

                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 55),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              myElivatedButton("Create user", () {
                                createNewUser();
                              }, 100, context, 40, elivatedButtonStyle,
                                  Colors.white)
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              const SizedBox(
                height: 3,
              ),
            ],
          ),
        ));
  }

//?=====================================================================
//*=================== Custom Widgets =================================
//?=====================================================================

  Widget customPermissionWidget(
    String text,
    BuildContext context,
    bool value,
    int i,
  ) {
    return GetBuilder<AdminPageConteroller>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.scale(
                scale: .7,
                child: CupertinoSwitch(
                    activeColor: faddedGreen,
                    value: controller.getPermissions()!.values.elementAt(i),
                    onChanged: (val) {
                      controller.changePermission(val, i);
                    })),
            Text(
              text,
              style:
                  Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 13),
            )
          ],
        );
      },
    );
  }

  // Widget permissionChips(BuildContext context) {
  //   return ChoiceChip(
  //     selectedColor: faddedGreen.withOpacity(0.2),
  //     label: Text("Manage Dashboard",
  //         style: Theme.of(context).textTheme.subtitle1!.copyWith(
  //               fontSize: 13,
  //             )),
  //     selected: true,
  //     onSelected: (value) {},
  //   );
  // }

  Text adminSubheading(BuildContext context, String txt, double size) {
    return Text(
      txt,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: size),
    );
  }

  Transform customSwitch() {
    return Transform.scale(
      scale: .7,
      child: CupertinoSwitch(
          activeColor: faddedGreen,
          value: adminPageConteroller.showPermissionsTab.value,
          onChanged: (value) {
            adminPageConteroller.showPermissionsTab.value =
                !adminPageConteroller.showPermissionsTab.value;
          }),
    );
  }

  Widget customDropDownButton(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: kdarkbg,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
              color: Colors.transparent, style: BorderStyle.solid, width: 0.80),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            iconEnabledColor: faddedGreen,
            alignment: Alignment.center,
            value: adminPageConteroller.selectedUserType.value,
            isExpanded: false,
            items: adminPageConteroller.userTypes.map((element) {
              return DropdownMenuItem<String>(
                child: Text(
                  element,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                value: element,
              );
            }).toList(),
            borderRadius: BorderRadius.circular(15),
            onChanged: (String? selectedValue) {
              adminPageConteroller.selectedUserType.value = selectedValue!;
              print("Selelcted value is" +
                  adminPageConteroller.selectedUserType.value);
            },
          ),
        ),
      ),
    );
  }
}
