import 'package:clean_morc/core/common/router/app_routing.dart';
import 'package:clean_morc/features/auth/auth_entities.dart';
import 'package:clean_morc/features/auth/presentation/changes_notifier/data_form_login_provider.dart';
import 'package:clean_morc/features/residential_complex_housing/data/repositories/residential_complex_housing_implementation_data.dart';
import 'package:clean_morc/features/residential_complex_housing/presentation/changes_notifier/residential_complex_housing_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/common/theme.dart' as theme;
import 'core/common/utils/app_preference.dart';
import 'core/presentation/change_notifier/preferences_user_satate_app.dart';
import 'core/presentation/change_notifier/theme_user_preferences.dart';
import 'features/residential_complex_housing/data/data_sources/residential_complex_housing_remote_data_source_from_api.dart';
import 'features/super_admin/presentation/changes_notifier/state_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.instance();
  runApp(const MorcApp());
}

class MorcApp extends StatelessWidget {
  const MorcApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthRequest authRequest = AuthRequest(
        email: '',
        password: ''); //TODO: crear el objeto inicializando los atributos
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.hasData) {
          return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) =>
                      PreferenceUserStateApp(sharedPreferences: snapshot.data!),
                ),
                ChangeNotifierProvider(
                  create: (_) =>
                      DataFormLoginProvider(authRequest: authRequest),
                ),
                ChangeNotifierProvider(create: (_) => StateNavigationBar()),
                ChangeNotifierProvider(
                    create: (_) => ThemeUserPreferencesProvider()),
                ChangeNotifierProvider(
                    create: (_) => ResidentialComplexHousingNotifier(
                        residentialComplexHousingImplementationData:
                            ResidentialComplexHousingImplementationData(
                                remoteDataSourceApi:
                                    ResidentialComplexHousingRemoteDataSourceFromApi()))),
              ],
              child: Builder(
                builder: (BuildContext context) {
                  final themeProvider =
                      Provider.of<ThemeUserPreferencesProvider>(context);
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter Demo',
                    //theme: theme.lightTheme,
                    theme: themeProvider.currentTheme,
                    //home: const RootPage(),
                    initialRoute: AppRouting.initialRoute,
                    routes: AppRouting.routes,
                  );
                },
              ));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
