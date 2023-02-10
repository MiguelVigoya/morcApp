import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/presentation/change_notifier/preferences_user_satate_app.dart';
import '../../../../core/presentation/change_notifier/theme_user_preferences.dart';
import '../../super_admin_entities.dart';
import '../changes_notifier/state_navigation_bar.dart';
import 'bottom_nav_bar.dart';
import 'navigation_bottom_top_bar.dart';

class CustomNavigationBarSuperAdmin extends StatelessWidget {
  final List<BottomNavBarEntity> listBottomsNav;
  const CustomNavigationBarSuperAdmin({Key? key, required this.listBottomsNav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateNavigationBar = Provider.of<StateNavigationBar>(context);
    final preferencesUser = Provider.of<ThemeUserPreferencesProvider>(context);

    for (var element in listBottomsNav) {
      element.src = preferencesUser.isDarkMode ? 'assets/rive_assets/light_icons.riv' : 'assets/rive_assets/dark_icon.riv';
    }

    return SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: const BoxDecoration(color: Colors.transparent),
          //decoration: const BoxDecoration(
            //color: MorcColors.grey, // TODO: condicionar color acuerdo al theme...
            // borderRadius: BorderRadius.all(Radius.circular(24)),
          //),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                border: Border.all(color: Theme.of(context).bottomAppBarColor, width: 2),
                //color: Theme.of(context).bottomAppBarColor, width: 2),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            ...List.generate(
              listBottomsNav.length,
              (index) => GestureDetector(
                  onTap: () {
                    listBottomsNav[index].input!.change(true);
                    stateNavigationBar.selectedPage = index;
                    stateNavigationBar.pageController.jumpToPage(stateNavigationBar.selectedPage);
                    if (listBottomsNav[index] != stateNavigationBar.selectedBottomNav) {
                    stateNavigationBar.selectedBottomNav = listBottomsNav[index];
                  }
                  Future.delayed(const Duration(milliseconds: 1000), () {
                    listBottomsNav[index].input!.change(false);
                  });

                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4.0, left: 14.0, right: 14.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NavigationBottomTopBar(
                          isActive: listBottomsNav[index] ==
                              stateNavigationBar.selectedBottomNav),
                      BottomNavBar(
                          selectedBottomNav: listBottomsNav[index],
                          isActive: listBottomsNav[index] ==
                              stateNavigationBar.selectedBottomNav),
                      //listBottomsNav[index] == stateNavigationBar.selectedBottomNav
                         // ?
                      Opacity(
                          opacity: listBottomsNav[index] == stateNavigationBar.selectedBottomNav ? 1 : 0,
                          child: Text( listBottomsNav[index].title,)),
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
          ),
        ));
  }
}
