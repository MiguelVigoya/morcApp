import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/presentation/change_notifier/theme_user_preferences.dart';


class SettingInitialPage extends StatelessWidget {
  const SettingInitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preferencesUser = Provider.of<ThemeUserPreferencesProvider>(context);
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SwitchListTile.adaptive(
              activeColor: Colors.purple,
              title: const Text('DarkMode'),
              value: preferencesUser.isDarkMode,
              onChanged: (value) {
                preferencesUser.isDarkMode = value;
                value
                    ? preferencesUser.setDarkTheme()
                    : preferencesUser.setLightTheme();
              }),
          const Center(child: Text('Setting Initial Page'),),
        ],
      )
    );
  }
}