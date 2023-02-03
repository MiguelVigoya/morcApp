import 'package:flutter/material.dart';

import '../../common/utils/list_icon_bottom_nav_bar.dart';
import '../../super_admin_entities.dart';

class StateNavigationBar extends ChangeNotifier {
  BottomNavBarEntity _selectedBottomNav = bottomNAvs.first;

  BottomNavBarEntity get selectedBottomNav => _selectedBottomNav;
  set selectedBottomNav( BottomNavBarEntity selectBottom ) {
    _selectedBottomNav = selectBottom;
    notifyListeners();
  }
}