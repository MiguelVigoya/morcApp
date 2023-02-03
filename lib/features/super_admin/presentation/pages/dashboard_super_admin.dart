import 'package:clean_morc/core/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/router/routes.dart';
import '../../../../core/presentation/change_notifier/auth_provider_state.dart';
import '../../common/utils/list_icon_bottom_nav_bar.dart';
import '../../super_admin_entities.dart';
import '../widgets/super_admin_widgets.dart';

class DashboardSuperAdmin extends StatelessWidget {
  const DashboardSuperAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final stateAuth = Provider.of<StateAuth>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              stateAuth.deleteAllData();
              Navigator.pushReplacementNamed(context, Routes.checkAuth);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        title: const Text('Dashboard Super Admin'),),
      body: const Center(child: Text('Dashboard Super Admin'),),
      bottomNavigationBar: CustomNavigationBarSuperAdmin(listBottomsNav: bottomNAvs,),
    );
  }
}











