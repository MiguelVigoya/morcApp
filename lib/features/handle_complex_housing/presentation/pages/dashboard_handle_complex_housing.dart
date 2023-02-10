import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/router/routes.dart';
import '../../../../core/presentation/change_notifier/preferences_user_satate_app.dart';

class DashboardHandleComplexHousing extends StatelessWidget {
  const DashboardHandleComplexHousing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateAuth = Provider.of<PreferenceUserStateApp>(context);

    return  Scaffold(
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
        title: const Text('Dashboard Super Admin'),
      ),
      body: const Center(
        child: Text('Dashboard HandleComplex Housing'),
      ),
    );
  }
}
