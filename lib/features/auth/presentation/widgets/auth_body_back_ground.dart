import 'package:clean_morc/features/auth/presentation/changes_notifier/data_form_login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/common/router/routes.dart';
import '../../../../core/common/theme.dart' show MorcColors, TextStyleHelper ;


class AuthBodyBackGround extends StatelessWidget {
  const AuthBodyBackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataFormLoginProvider dataFormLoginProvider = Provider.of<DataFormLoginProvider>(context);
    Size size = MediaQuery.of(context).size;
    //const bool isDarkMode = false; //TODO: cambiar verificación del darkMode

    return SingleChildScrollView(
      child: Padding(padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Inicio de Sesión',
            textAlign: TextAlign.center,
            style: TextStyleHelper.text1
          ),
          const SizedBox(height: 40,),
          const Text('Email:',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
            //style: TextStyleHelper.labelTextFormStyle,
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: dataFormLoginProvider.emailController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_rounded),
                hintText: 'Escriba su Email'),
          ),
          const SizedBox(height: 40,),
          const Text('Password:',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: dataFormLoginProvider.passwordController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.key_rounded),
              hintText: 'Password',),
          ),
          SizedBox(height: size.height * 0.08,),
           // Boton Login
           InkWell(
             onTap: () async{
                final bool isLogin = await dataFormLoginProvider.login();
                if(!isLogin) return;
                Navigator.pushReplacementNamed(context, Routes.checkAuth);
             },
             child: Padding(
               padding: const EdgeInsets.all(25),
               child:  Container(
                 padding: const EdgeInsets.all(12),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15),
                   color: MorcColors.orange50,
                 ),
                 child: const Text(
                   'Login',
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     color: MorcColors.white,
                     fontSize: 22,
                     fontWeight: FontWeight.bold,
                     fontStyle: FontStyle.normal,
                   ),
                 ),
               )
           ),
           ),

        ],
      ),)
    );
  }
}
