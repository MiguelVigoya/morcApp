
import 'package:rive/rive.dart';

class BottomNavBarEntity {
  String artboard, stateMachineName, title, src;
  late SMIBool? input;

   BottomNavBarEntity(
      {this.src = 'assets/rive_assets/icons.riv',
        required this.artboard,
        required this.stateMachineName,
        required this.title,
        this.input});
}