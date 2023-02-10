
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BottomNavBarEntity {
  String artboard, stateMachineName, title, src;
  final bool isDark;
  late SMIBool? input;

   BottomNavBarEntity(
      { required this.isDark,
        required this.artboard,
        required this.stateMachineName,
        required this.title,
        this.input,}) : src = isDark ? 'assets/rive_assets/dark_icon.riv' : 'assets/rive_assets/light_icons.riv';
}