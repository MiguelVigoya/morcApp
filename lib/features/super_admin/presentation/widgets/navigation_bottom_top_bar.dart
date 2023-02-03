import 'package:flutter/material.dart';
import 'package:clean_morc/core/common/theme.dart';


class NavigationBottomTopBar extends StatelessWidget {
  const NavigationBottomTopBar({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(bottom: 3),
      height: 3,
      width: isActive ? 30 : 0,
      decoration: const BoxDecoration(
          color: MorcColors.orange70, // TODO: cambiar color acuerdo al tema.
          borderRadius: BorderRadius.all(Radius.circular(15))),
      duration: const Duration(milliseconds: 200),
    );
  }
}