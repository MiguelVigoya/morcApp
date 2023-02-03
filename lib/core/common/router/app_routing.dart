import 'package:clean_morc/core/common/router/routes.dart';
import 'package:flutter/material.dart';

class AppRouting {
  static String initialRoute = Routes.checkAuth;

  static Map<String, Widget Function(BuildContext)> routes = {

    Routes.checkAuth: (_) =>
        const RootPagesWithProvider(),

    Routes.login: (_) =>
        const LoginPage(),

    Routes.dashBoardSuperAdmin: (_) =>
        DashboardSuperAdmin(),

    Routes.dashBoardHandleComplexHousing: (_) =>
        const DashboardHandleComplexHousing(),

  };
}
