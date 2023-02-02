import 'package:flutter/material.dart';


class AuthBackgroundPage extends StatelessWidget {
  final Widget header;
  final Widget iconHeader;
  final Widget child;


  const AuthBackgroundPage(
      {Key? key, required this.header, required this.iconHeader, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Stack(children: [
                  header,
                  iconHeader,
                ],)),
            Expanded(flex: 2, child: child)
          ],
        )
    );
  }
}