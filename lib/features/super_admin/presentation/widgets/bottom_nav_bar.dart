import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../common/utils/list_icon_bottom_nav_bar.dart';
import '../../common/utils/rive_utils.dart';
import '../../super_admin_entities.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {Key? key, required this.selectedBottomNav, required this.isActive})
      : super(key: key);

  final BottomNavBarEntity selectedBottomNav;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: Opacity(
        opacity: isActive ? 0.7 : 0.5,
        child: RiveAnimation.asset(
          bottomNAvs.first.src,
          artboard: selectedBottomNav.artboard,
          onInit: (artboard) {
            StateMachineController controller = RiveUtils.getRiveController(
                artboard,
                stateMachineName: selectedBottomNav.stateMachineName);
            selectedBottomNav.input = controller.findSMI('active') as SMIBool;
          },
        ),
      ),
    );
  }
}