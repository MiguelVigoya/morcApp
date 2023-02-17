import 'package:clean_morc/core/common/router/app_routing.dart';
import 'package:clean_morc/features/auth/auth_entities.dart';
import 'package:clean_morc/features/auth/presentation/changes_notifier/data_form_login_provider.dart';
import 'package:clean_morc/features/persons/data/data_sources/data_persons_from_api.dart';
import 'package:clean_morc/features/residential_complex_housing/data/repositories/residential_complex_housing_implementation_data.dart';
import 'package:clean_morc/features/residential_complex_housing/presentation/changes_notifier/residential_complex_housing_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/common/utils/app_preference.dart';
import 'core/presentation/change_notifier/preferences_user_satate_app.dart';
import 'core/presentation/change_notifier/theme_user_preferences.dart';
import 'features/persons/data/repositories/person_repository_implementation_data.dart';
import 'features/persons/presentation/changes_notifier/person_notifiers.dart';
import 'features/residential_complex_housing/data/data_sources/residential_complex_housing_remote_data_source_from_api.dart';
import 'features/residential_complex_housing/data/models/residential_complex_housing_model.dart';
import 'features/residential_complex_housing/presentation/changes_notifier/data_form_register_residential_complex_housing_provider.dart';
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
    final residentialTemp = ResidentialComplexHousingModel(id: null, name: '', address: '', personIds: [], subscription: false);
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
                      residentialComplexHousing: residentialTemp,
                      residentialComplexHousingImplementationData:
                      ResidentialComplexHousingImplementationData(
                          remoteDataSourceApi:
                          ResidentialComplexHousingRemoteDataSourceFromApi()),)),
                ChangeNotifierProvider(
                  create: (_) => PersonNotifier(
                      personRepositoryImplementationData:
                          PersonRepositoryImplementationData(
                              dataPersonsFromApi: DataPersonsFromApi())),
                ),
                ChangeNotifierProvider(
                    create: (BuildContext context) => DataFormRegisterResidentialComplexHousingProvider( residentialTemp ),
                )
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
