import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthIconHeader extends StatelessWidget {
  final String urlImage;
  const AuthIconHeader({
    Key? key,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Padding(
        padding: const EdgeInsets.only(top: 0.5),
        child: SvgPicture.asset(urlImage, height: double.infinity,)));
  }
}
