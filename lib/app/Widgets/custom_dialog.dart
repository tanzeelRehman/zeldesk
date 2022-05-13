import 'package:flutter/material.dart';

import 'package:zeldesk/app/Widgets/my_elivated_button.dart';
import 'package:zeldesk/core/constants/colors.dart';
import 'package:zeldesk/core/constants/styles.dart';

class CustomDialog extends StatelessWidget {
  final String decription;
  final VoidCallback onPressed;

  final bool isWarning;
  final bool isInfo;
  final bool isError;
  final bool isSucess;
  CustomDialog(
      {Key? key,
      required this.decription,
      required this.onPressed,
      this.isWarning = false,
      this.isInfo = false,
      required this.isError,
      this.isSucess = false})
      : super(key: key);

  Color? color;
  late IconData icon;
  late String title;
  late String buttontxt;
  late ButtonStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    if (isError) {
      color = Colors.red[300];
      icon = Icons.error;
      title = "Error";
      buttontxt = "Dismiss";
      buttonStyle = redElivatedButtonStyle;
    } else if (isInfo) {
      color = Colors.blue[300];
      icon = Icons.info;
      title = "Info";
      buttontxt = "Understand";
      buttonStyle = blueElivatedButtonStyle;
    } else if (isSucess) {
      color = Colors.green[300];
      icon = Icons.check;
      title = "Sucess";
      buttontxt = "Okay, cool";
      buttonStyle = greenElivatedButtonStyle;
    } else if (isWarning) {
      color = Colors.yellow[300];
      icon = Icons.warning;
      title = "Warning";
      buttontxt = "I Know";
      buttonStyle = yellowElivatedButtonStyle;
    }
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: SizedBox(
        height: 300,
        width: 300,
        child: Column(
          children: [
            Container(
              height: 160,
              width: double.infinity,
              color: color,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                      size: 90,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      title,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Center(
                child: Text(
                  decription,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ),
            myElivatedButton(
                buttontxt, () {}, 200, context, 40, buttonStyle, Colors.white)
          ],
        ),
      ),
    );
  }
}
