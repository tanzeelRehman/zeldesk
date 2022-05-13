import 'package:get/get.dart';
import 'package:zeldesk/app/Modules/Login/controller/login_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
