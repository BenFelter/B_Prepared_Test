import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/theme/constants.dart';

class CustomColors {
  CustomColors._();

  static const Color scoutingBlue = Color(0xFF003f87);
  static const Color selectionBlue = Color(0xFF4368C8);
}

// This is our  main focus
// Let's apply light and dark theme on our app
// Now let's add dark theme on our app

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: kContentColorLightTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorLightTheme),
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.white,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  // Bydefault flutter provie us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kContentColorLightTheme,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: kContentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: kContentColorDarkTheme),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.white,
    ),
  );
}

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);

// class AppTheme {
//   AppTheme._();

//   static final ThemeData lightTheme = ThemeData(
//     scaffoldBackgroundColor: Colors.white,
//     appBarTheme: AppBarTheme(
//       color: CustomColors.scoutingBlue,
//       iconTheme: IconThemeData(
//         color: Colors.grey.shade300,
//       ),
//     ),
//     textTheme: const TextTheme(
//       headline6: TextStyle(color: Colors.white, fontSize: 20.0),
//     ),
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//         backgroundColor: CustomColors.scoutingBlue),
//   );

//   static final ThemeData darkTheme = ThemeData(
//     scaffoldBackgroundColor: Colors.black,
//     appBarTheme: AppBarTheme(
//       color: Colors.blueGrey,
//       iconTheme: IconThemeData(
//         color: Colors.grey.shade300,
//       ),
//     ),
//     textTheme: const TextTheme(
//       headline6: TextStyle(color: Colors.white, fontSize: 20.0),
//     ),
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: CustomColors.scoutingBlue,
//     ),
//     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       backgroundColor: Colors.white,
//       selectedItemColor: CustomColors.selectionBlue,
//       unselectedItemColor: Colors.grey,
//     ),
//   );
// }
