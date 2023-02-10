
import 'package:clean_morc/features/super_admin/presentation/changes_notifier/state_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/router/routes.dart';
import '../../../../core/presentation/change_notifier/preferences_user_satate_app.dart';
import '../../common/utils/list_icon_bottom_nav_bar.dart';
import '../widgets/super_admin_widgets.dart';

class DashboardSuperAdmin extends StatelessWidget {
  const DashboardSuperAdmin({super.key});

  @override
  Widget build(BuildContext context) {

    final stateAuth = Provider.of<PreferenceUserStateApp>(context);
    final stateNavigationBar = Provider.of<StateNavigationBar>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // TODO: CAMBIAR LAS PREFERENCIAS DE USUARIO DE LA APP
              stateAuth.deleteAllData();
              Navigator.pushReplacementNamed(context, Routes.checkAuth);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        title: const Text('Dashboard Super Admin'),),
      body: PageView(
        controller: stateNavigationBar.pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          stateNavigationBar.selectedPage = index;
        },
        children : const [
          ResidentialInitialPage(),
          PersonInitialPage(),
          SettingInitialPage(),
        ]

      ),
      /*
      body:
      */
      bottomNavigationBar: CustomNavigationBarSuperAdmin(listBottomsNav: bottomNAvs,),
    );
  }


}













