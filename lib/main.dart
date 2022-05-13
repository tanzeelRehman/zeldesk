import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zeldesk/app/Modules/Login/controller/login_controller.dart';

import 'package:zeldesk/core/Theme/my_light_theme.dart';

import 'package:zeldesk/routes/local_navigator.dart';
import 'package:zeldesk/routes/pages.dart';
import 'package:zeldesk/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCVxcHByQ6bkLD-EzPSI5T7hsJtUAtS-fU",
          appId: "1:345064441559:web:4664395311da464bd6d292",
          messagingSenderId: "345064441559",
          projectId: "z-desk-6d24c"));

  Get.put(LoginController());
  Get.put(LocalNavigator());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme,
      initialRoute: Routes.ADMIN_PAGE,
      getPages: Pages.pages,
    );
  }
}
