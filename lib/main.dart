import 'package:clean_morc/core/common/router/app_routing.dart';
import 'package:clean_morc/features/auth/auth_entities.dart';
import 'package:clean_morc/features/auth/presentation/changes_notifier/data_form_login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/common/theme.dart';
import 'core/presentation/change_notifier/auth_provider_state.dart';
import 'core/presentation/pages/root_pages_provider.dart';
import 'features/super_admin/presentation/changes_notifier/state_navigation_bar.dart';

void main() {
  runApp(const MorcApp());
}

class MorcApp extends StatelessWidget {
  const MorcApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthRequest authRequest = AuthRequest(email: '', password: ''); //TODO: crear el objeto inicializando los atributos
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.hasData) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => StateAuth(sharedPreferences: snapshot.data!),),
              ChangeNotifierProvider(
                create: (_) => DataFormLoginProvider(authRequest: authRequest),),
              ChangeNotifierProvider(
                  create: (_) => StateNavigationBar())
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              //theme: lightTheme,
              theme: darkTheme,
              //home: const RootPage(),
              initialRoute: AppRouting.initialRoute,
              routes: AppRouting.routes,
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
