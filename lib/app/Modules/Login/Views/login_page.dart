import 'package:flutter/material.dart';
import 'package:zeldesk/app/Modules/Login/widgets/form_login.dart';

import 'package:zeldesk/app/Modules/Login/widgets/text_desc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 55),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                textDesc(context),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height / 8),
                  child: Column(
                    children: [
                      const Text(
                        "Login to your Dshboard",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(width: 320, child: FormLogin()),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
