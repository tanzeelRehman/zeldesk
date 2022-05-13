import 'package:flutter/material.dart';

import 'package:zeldesk/core/constants/styles.dart';

class AdminPageTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final Function()? ontap;
  final bool obsecureText;
  const AdminPageTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.validator,
    this.ontap,
    required this.obsecureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: TextFormField(
        obscureText: obsecureText,
        onTap: ontap,
        validator: validator,
        controller: controller,
        decoration: textfieldDecoration1.copyWith(hintText: hint),
      ),
    );
  }
}
