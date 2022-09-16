import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeldesk/app/Modules/admin/controller/admin_page_controller.dart';
import 'package:zeldesk/app/Modules/admin/controller/department_controller.dart';
import 'package:zeldesk/app/Modules/admin/widgets/admin_page_textfield.dart';
import 'package:zeldesk/app/Modules/admin/widgets/admin_section_heading.dart';
import 'package:zeldesk/app/Modules/admin/widgets/hr_line.dart';
import 'package:zeldesk/app/Widgets/custom_decroated_box.dart';
import 'package:zeldesk/app/Widgets/custom_dialog.dart';
import 'package:zeldesk/app/Widgets/my_elivated_button.dart';
import 'package:zeldesk/app/Widgets/profile_dropdown.dart';
import 'package:zeldesk/core/constants/colors.dart';
import 'package:zeldesk/core/constants/styles.dart';

class CreateDeptPage extends StatelessWidget {
  late Size _screen;
  final TextEditingController deptNameText = TextEditingController();
  final DepartmentController deptController = Get.put(DepartmentController());
  @override
  Widget build(BuildContext context) {
    _screen = MediaQuery.of(context).size;
    void createDept() {
      deptController.createNewDepartment(name: deptNameText.text);
    }

    return Container(
      color: kdarkbg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //? NAVBAR  IS HERE
          Container(
            height: 60,
            color: klightbg,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              //TODO CREATE DEPT DROPDOWN HERE
              // children: [ProfileDropDown(name: name, items: items)],
            ),
          ),

          // //? MAIN SECTION HEADING
          // adminsectionHeading(
          //     context, 10, 40, "Create a new department", 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
            child: CustomDecorationBox(
              width: _screen.width * 0.8,
              height: 478,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          adminsectionHeading(
                              context, 0, 0, "Department name", 20),
                        ],
                      ),
                      SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            AdminPageTextField(
                              obsecureText: false,
                              controller: deptNameText,
                              hint: "Enter Department Name",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  horizentalLine(15),
                  const SizedBox(
                    height: 8,
                  ),
                  //* SECTION 2 STARTS HERE
                  Column(
                    children: [
                      adminsectionHeading(
                          context, 0, 0, "Department agents", 20),
                      GetBuilder<DepartmentController>(
                          builder: (deptController) {
                        return Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SizedBox(
                              height: _screen.height * 0.40,
                              child: deptController.employeeListIsLoading
                                  ? Container(
                                      height: 80,
                                      width: 80,
                                      child: CircularProgressIndicator())
                                  : ListView.builder(
                                      controller: ScrollController(),
                                      itemCount:
                                          deptController.employeeList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return employeeRow(
                                            context, deptController, index);
                                      }),
                            ));
                      }),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Container(
                          height: 2,
                          color: kdarkbg,
                          width: double.infinity,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          myElivatedButton("Create Department", () {
                            createDept();
                          }, 130, context, 40, elivatedButtonStyle,
                              Colors.white),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // const SizedBox(
          //   height: 5,
          // )
        ],
      ),
    );
  }

  Widget employeeRow(
      BuildContext context, DepartmentController conteroller, int index) {
    return ListTile(
        leading: Checkbox(
            activeColor: faddedGreen,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            hoverColor: Colors.transparent,
            splashRadius: 0.0,
            value: conteroller.employeeList[index].isSelected,
            onChanged: (val) {
              conteroller.updateCheckbox(index);
            }),
        title: adminsectionHeading(
            context, 5, 5, conteroller.employeeList[index].name, 15),
        subtitle: adminsectionHeading(
            context, 5, 5, conteroller.employeeList[index].email, 12),
        isThreeLine: true,
        trailing: SizedBox(
          width: 400,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              adminsectionHeading(
                  context, 5, 5, conteroller.employeeList[index].userType, 15),
              const SizedBox(
                width: 150,
              ),
              CircleAvatar(
                radius: 15,
                backgroundColor: faddedGreen.withOpacity(0.2),
                child:
                    Text(conteroller.employeeList[index].name.characters.first),
              ),
            ],
          ),
        ));
  }
}
