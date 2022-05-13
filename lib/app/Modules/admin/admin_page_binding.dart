import 'package:get/get.dart';
import 'package:zeldesk/app/Modules/admin/controller/admin_page_controller.dart';

class AdminPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AdminPageConteroller());
  }
}
