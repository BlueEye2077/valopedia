import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valopedia/constants/my_colors.dart';

ThemeData kThemeData = ThemeData().copyWith(
  brightness: .dark,
  textTheme: GoogleFonts.russoOneTextTheme(),
  canvasColor: MyColors.myGrey,
  scaffoldBackgroundColor: MyColors.myGrey,

  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      .android: CupertinoPageTransitionsBuilder(),
      .iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);
