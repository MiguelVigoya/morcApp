import 'package:flutter/material.dart';
import '../widgets/auth_widgets.dart';




class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  const Scaffold(
      body: AuthBackgroundPage(
        header:  AuthHeader(),
        iconHeader: AuthIconHeader(urlImage: 'assets/icons/login.svg',),
        child: AuthBodyBackGround(),
      ),
    );


    //'assets/icons/login.svg'
  }
}
