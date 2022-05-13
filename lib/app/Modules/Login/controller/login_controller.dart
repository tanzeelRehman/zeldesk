import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zeldesk/app/Modules/Login/controller/get_login_instance.dart';
import 'package:zeldesk/app/data/Models/user_model.dart';
import 'package:zeldesk/app/data/Services/firebase/auth_services.dart';
import 'package:zeldesk/app/data/Services/firebase/fireStore_service.dart';
import 'package:zeldesk/routes/routes.dart';

class LoginController extends GetxController {
  var selectedUserType = "Admin".obs;
  var userTypes = ["Admin", "Employee", "Customer"].obs;

  Future login({
    required String email,
    required String password,
    required String userType,
  }) async {
    var authResult = (await AuthServices().loginUser(
      email: email,
      password: password,
    ));
    var docResult = await FireStoreService().getUser();
    if (docResult is UserModel) {
      GetLoginUserInstance.instance.user = docResult;
      print(GetLoginUserInstance.instance.user!.userType);
      if (GetLoginUserInstance.instance.user!.userType == 'Admin') {
        return const RouteSettings(name: Routes.ADMIN_PAGE);
      } else if (GetLoginUserInstance.instance.user!.userType == 'Employee') {
        return const RouteSettings(name: Routes.LOGIN);
      } else if (GetLoginUserInstance.instance.user!.userType == 'Customer') {
        Get.offNamed(Routes.CUSTOMER_PORTAL_PAGE);
      } else {
        return const RouteSettings(name: Routes.LOGIN);
      }
    }

    return authResult;
  }
}
