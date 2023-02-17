import 'package:flutter/material.dart';

import '../../common/utils/list_icon_bottom_nav_bar.dart';
import '../../super_admin_entities.dart';

class StateNavigationBar extends ChangeNotifier {
  BottomNavBarEntity _selectedBottomNav = bottomNAvs.first;
  int _currentIndex = 0;
  bool _isBarrierDismissible = false;

  bool get isBarrierDismissible => _isBarrierDismissible;

  set isBarrierDismissible(bool value) {
    _isBarrierDismissible = value;
    notifyListeners();
  }

  int get selectedPage => _currentIndex;

  set selectedPage(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  final PageController pageController = PageController(initialPage: 0);

  BottomNavBarEntity get selectedBottomNav => _selectedBottomNav;
  set selectedBottomNav( BottomNavBarEntity selectBottom ) {
    _selectedBottomNav = selectBottom;
    notifyListeners();
  }
}