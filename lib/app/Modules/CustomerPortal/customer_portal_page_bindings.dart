import 'package:get/get.dart';
import 'package:zeldesk/app/Modules/CustomerPortal/controller/customer_controller.dart';

class CustomerPotalPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerController>(() => CustomerController());
  }
}
