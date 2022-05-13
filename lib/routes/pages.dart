import 'package:get/get.dart';
import 'package:zeldesk/app/Modules/CustomerPortal/customer_portal_page_bindings.dart';
import 'package:zeldesk/app/Modules/CustomerPortal/views/customer_portal_page.dart';
import 'package:zeldesk/app/Modules/Login/login_Page_binding.dart';

import 'package:zeldesk/app/Modules/Login/Views/login_page.dart';
import 'package:zeldesk/app/Modules/admin/admin_page_binding.dart';
import 'package:zeldesk/app/Modules/admin/views/admin_page.dart';
import 'package:zeldesk/routes/routes.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      binding: LoginPageBinding(),
      page: () => LoginPage(),
    ),
    GetPage(
        name: Routes.ADMIN_PAGE,
        binding: AdminPageBinding(),
        page: () => AdminPage()),
    GetPage(
        binding: CustomerPotalPageBindings(),
        name: Routes.CUSTOMER_PORTAL_PAGE,
        page: () => CustomerPortalpage()),
  ];
}
