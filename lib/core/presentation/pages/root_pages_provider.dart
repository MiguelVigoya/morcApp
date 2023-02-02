import 'package:clean_morc/core/presentation/pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../features/auth/presentation/pages/login.dart';
import '../../../features/handle_complex_housing/presentation/pages/handle_complex_housing_pages.dart';
import '../../../features/super_admin/presentation/pages/super_admin_pages.dart';
import '../../common/theme.dart';
import '../change_notifier/auth_provider_state.dart';

class RootPagesWithProvider extends StatelessWidget {
  const RootPagesWithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateAuth = Provider.of<StateAuth>(context);
    return Scaffold(
        body: FutureBuilder(
      future: stateAuth.getRole(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            //TODO: redireccionar a una vista de no data...
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          );
        }
        _redirectingView(context: context, routeName: snapshot.data!);
        return const RootPage();//
      },
    ));
  }

  void _redirectingView({required BuildContext context,  required String routeName}) {
    switch (routeName) {
      case 'LOGIN':
        _redirectionTo(context, const LoginPage());
        break;
      case 'HANDLE_COMPLEX_HOUSING':
        _redirectionTo(context, const DashboardHandleComplexHousing());
        break;
      case 'SUPER_ADMIN':
        _redirectionTo(context, const DashboardSuperAdmin());
        break;
    }
  }

  void _redirectionTo(BuildContext context, Widget page) {
    Future.microtask(() {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => page,
              transitionDuration: const Duration(seconds: 0)));
    });
  }
}
