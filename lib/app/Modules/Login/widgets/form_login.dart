import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeldesk/app/Modules/Login/controller/login_controller.dart';

import 'package:zeldesk/app/Widgets/my_elivated_button.dart';
import 'package:zeldesk/app/Widgets/custom_dialog.dart';
import 'package:zeldesk/core/constants/colors.dart';

import 'package:zeldesk/core/constants/styles.dart';

class FormLogin extends StatelessWidget {
  LoginController loginController = Get.find<LoginController>();
  final TextEditingController emailText = TextEditingController();
  final TextEditingController passwordText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void signIn() async {
      var result = await loginController.login(
        email: emailText.text,
        password: passwordText.text,
        userType: loginController.selectedUserType.value,
      );

      if (result is! bool) {
        showDialog(
            context: context,
            builder: (context) {
              return CustomDialog(
                decription: result.toString(),
                isError: true,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              );
            });
      }
    }

    return Column(
      children: [
        const SizedBox(height: 30),
        TextField(
            controller: emailText,
            decoration: textfieldDecoration1.copyWith(hintText: "Enter email")),
        const SizedBox(height: 30),
        TextField(
            controller: passwordText,
            onChanged: (value) {},
            decoration: textfieldDecoration1.copyWith(hintText: "Password")),
        const SizedBox(height: 40),
        myElivatedButton(
          "Sign in",
          () {
            signIn();
          },
          double.infinity,
          context,
          50,
          elivatedButtonStyle2,
          Colors.white,
        )
      ],
    );
  }

  Widget customDropDownButton(BuildContext context) {
    return SizedBox(
      width: 330,
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
            value: loginController.selectedUserType.value,
            isExpanded: false,
            items: loginController.userTypes.map((element) {
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
              loginController.selectedUserType.value = selectedValue!;
              print("Selelcted value is" +
                  loginController.selectedUserType.value);
            },
          ),
        ),
      ),
    );
  }
}
