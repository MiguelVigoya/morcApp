import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui_helpers/input_decoration_theme.dart';



class MorcColors {
  static const purple = Color(0xFF5117AC);
  static const lightPurple = Color(0xFF6B4FAD);
  static const green = Color(0xFF20D0C4);
  static const dark = Color(0xFF03091E);
  static const grey = Color(0xFF21273B);
  static const darkGrey = Color(0xFF21212A);
  static const lightGrey = Color(0xFFBBBBBB);
  static const veryLightGrey = Color(0xFFF3F3F3);
  static const white = Color(0xFFFFFFFF);
  static const darkWhite = Color(0xFFB1B1B1);
  static const pink = Color(0xFFF5638B);
  static const orange10 = Color(0xFFF3A603);
  static const orange20 = Color(0xFFE76E06);
  static const orange30 = Color(0xFFF8821D);
  static const orange40 = Color(0xffd96d2c);
  static const orange50 = Color(0xffdc702e);
  static const orange60 = Color(0xffbb4c0a);
  static const orange70 = Color(0xff9a3c05);
  static const orange90 = Color(0xff4c200b);
  static const veryLightOrange = Color(0xFFD7A477);
}

final morcGradientAccessColorAppBarLight = [
  MorcColors.orange10,
  MorcColors.orange50,
  MorcColors.orange40,
  MorcColors.orange60,
];

final morcGradientAccessColorAppBarDark = [
  //MorcColors.orange60,
  MorcColors.orange70,
  MorcColors.orange90,

];

final ThemeData lightTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(MorcColors.orange40),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  ),
  appBarTheme: InputDecorationThemeHelper.fontAppBarLightMode,
  canvasColor: MorcColors.white,
  textTheme: InputDecorationThemeHelper.googleFontLightMode,
  inputDecorationTheme: InputDecorationThemeHelper.decorationLightMode,
  iconTheme: const IconThemeData(color: MorcColors.lightPurple,),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: MorcColors.white,
    selectedItemColor: MorcColors.purple,
    unselectedItemColor: MorcColors.lightGrey,
  ),
  bottomAppBarColor: MorcColors.veryLightGrey,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: MorcColors.lightPurple),
  listTileTheme: const ListTileThemeData(
    selectedColor: MorcColors.purple,
    selectedTileColor: MorcColors.veryLightGrey,
    iconColor: MorcColors.lightPurple,
    tileColor: MorcColors.veryLightGrey,
  ),
);

final ThemeData darkTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(
            color: MorcColors.darkWhite,
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
      backgroundColor: MaterialStateProperty.all(MorcColors.orange60),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  ),
  appBarTheme: InputDecorationThemeHelper.fontAppBarDarkMode,
  canvasColor: MorcColors.grey,
  scaffoldBackgroundColor: MorcColors.dark,
  textTheme: InputDecorationThemeHelper.googleFontDarkMode,
  inputDecorationTheme: InputDecorationThemeHelper.decorationDarkMode,
  iconTheme: const IconThemeData(color: MorcColors.darkWhite,),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //backgroundColor: Colors.transparent,
    //selectedItemColor: MorcColors.darkWhite,
    //unselectedItemColor: MorcColors.darkWhite,
  ),
  bottomAppBarColor: Colors.transparent, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: MorcColors.darkWhite),
  listTileTheme: const ListTileThemeData(
    iconColor: MorcColors.darkWhite,
    tileColor: MorcColors.darkGrey,
    selectedColor: MorcColors.darkWhite,
    selectedTileColor: MorcColors.darkGrey,
  )

);

final morcGradientColorApp = [
  MorcColors.veryLightOrange,
  MorcColors.orange30,
  MorcColors.purple
];

//TODO: indagar GoogleFonts.poppinsTextTheme().copyWith() para editar googleFonts
class TextStyleHelper{
  static final text1 = GoogleFonts.poppins(
      fontWeight: FontWeight.bold,
      fontSize: 26,
      fontStyle: FontStyle.normal
  );

  static final labelTextFormStyle = GoogleFonts.poppins(
        color: MorcColors.purple,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
  );

}
