import 'package:flutter/material.dart';

import 'package:zeldesk/app/Modules/admin/views/Pages/create_dept_page.dart';
import 'package:zeldesk/app/Modules/admin/views/Pages/create_user_page.dart';
import 'package:zeldesk/app/Modules/admin/views/Pages/dashboard_page.dart';
import 'package:zeldesk/app/Modules/admin/views/Pages/dept_agents_page.dart';
import 'package:zeldesk/app/Modules/admin/views/Pages/dept_details_page.dart';

import 'package:zeldesk/app/Widgets/custom_animated_drawer.dart';

import 'package:zeldesk/routes/navigator_keys.dart';
import 'package:zeldesk/routes/routes.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CustomAnimatedDrawer(),
          Flexible(
            fit: FlexFit.loose,
            child: Navigator(
              key: NavigatorKeys.dashboardNavigator,
              initialRoute: Routes.DASHBOARD,
              onGenerateRoute: (RouteSettings settings) {
                switch (settings.name) {
                  case Routes.DASHBOARD:
                    return _getPageRoute(DashboardPage());
                  case Routes.TICKETS:
                    return _getPageRoute(DashboardPage());
                  case Routes.CREATE_USER:
                    return _getPageRoute(CreateUserPage());
                  case Routes.CREATE_DEPT:
                    return _getPageRoute(CreateDeptPage());
                  case Routes.DEPT_DETAILS:
                    return _getPageRoute(DepartmentDetails());
                  case Routes.DEPT_AGENTS:
                    return _getPageRoute(DepartmentAgents());
                  default:
                    return _getPageRoute(DashboardPage());
                }
              },
            ),
          )
        ],
      ),
    );
  }

  PageRoute _getPageRoute(Widget child) {
    return MaterialPageRoute(
      builder: (context) => child,
    );
  }
}
