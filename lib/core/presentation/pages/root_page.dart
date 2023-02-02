import 'package:flutter/material.dart';

import '../../common/theme.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: morcGradientColorApp,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: MorcColors.purple,
            radius: 70,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/icons/main_icon_app.png'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Morc',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontWeight: FontWeight.bold, color: MorcColors.purple),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 5.0),
                child: Text(
                  'App',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontWeight: FontWeight.bold, color: MorcColors.purple),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
