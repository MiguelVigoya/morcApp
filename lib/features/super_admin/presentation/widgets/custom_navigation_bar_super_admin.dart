import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/theme.dart';
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
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: MorcColors.grey, // TODO: condicionar color acuerdo al theme...
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
            listBottomsNav.length,
            (index) => GestureDetector(
              onTap: () {
                //setState(() {
                listBottomsNav[index].input!.change(true);
                if (listBottomsNav[index] != stateNavigationBar.selectedBottomNav) {
                  stateNavigationBar.selectedBottomNav = listBottomsNav[index];
                }
                Future.delayed(const Duration(milliseconds: 1000), () {
                  listBottomsNav[index].input!.change(false);
                });
                //});
              },
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
                  listBottomsNav[index] == stateNavigationBar.selectedBottomNav
                      ? Text(
                    listBottomsNav[index].title,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
