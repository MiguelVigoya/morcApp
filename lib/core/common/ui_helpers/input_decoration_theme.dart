import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';



class InputDecorationThemeHelper {

  static AppBarTheme fontAppBarLightMode = AppBarTheme(

      color:  MorcColors.orange30,

      toolbarTextStyle: GoogleFonts.poppinsTextTheme().copyWith(
        headline6:const TextStyle(
            fontSize: 20,
            color: MorcColors.purple,
            fontWeight: FontWeight.bold
        )
    ).bodyText2, titleTextStyle: GoogleFonts.poppinsTextTheme().copyWith(
        headline6: const TextStyle(
            fontSize: 20,
            color: MorcColors.purple,
            fontWeight: FontWeight.bold
        )
    ).headline6,

  );


  static AppBarTheme fontAppBarDarkMode = AppBarTheme(
    color:  MorcColors.orange60,

      toolbarTextStyle: GoogleFonts.poppinsTextTheme().copyWith(
          headline6:const TextStyle(
              fontSize: 20,
              color: MorcColors.darkWhite,
              fontWeight: FontWeight.bold
          )
      ).bodyText2, titleTextStyle: GoogleFonts.poppinsTextTheme().copyWith(
      headline6:const TextStyle(
          fontSize: 20,
          color: MorcColors.darkWhite,
          fontWeight: FontWeight.bold
      )
  ).headline6
  );



  static TextTheme googleFontLightMode = GoogleFonts.poppinsTextTheme().apply(
    bodyColor: MorcColors.purple,
    displayColor: MorcColors.purple,
  );

  static TextTheme googleFontDarkMode = GoogleFonts.poppinsTextTheme().apply(
    bodyColor: MorcColors.darkWhite,
    displayColor: MorcColors.darkWhite,
  );

  static InputDecorationTheme decorationLightMode = InputDecorationTheme(
    focusColor: MorcColors.purple,
    enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
      color: MorcColors.purple,
    )),
    focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: MorcColors.orange60, width: 2.5)),
    hintStyle: GoogleFonts.poppins(
      color: MorcColors.lightPurple,
      fontSize: 16,
    ),
    //labelStyle: GoogleFonts.poppins(color: MorcColors.purple, fontSize: 18,),
    //hintStyle: TextStyle(color: MorcColors.lightPurple),
    prefixIconColor: MorcColors.lightPurple,
  );

  static InputDecorationTheme decorationDarkMode =  InputDecorationTheme(
    focusColor: MorcColors.darkGrey,
    fillColor: MorcColors.darkGrey,
    filled: true,
    enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
      color: MorcColors.orange90,
    )),
    focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: MorcColors.orange70, width: 2.5)),
    hintStyle: GoogleFonts.poppins(
      color: MorcColors.darkWhite,
      fontSize: 16,
    ),
    labelStyle: GoogleFonts.poppins(
      color: MorcColors.darkWhite,
      fontSize: 30,
    ),
    //hintStyle: TextStyle(color: MorcColors.darkWhite),
    prefixIconColor: MorcColors.darkWhite,
  );
}
