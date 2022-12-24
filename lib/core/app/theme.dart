import 'package:flutter/material.dart';
import 'package:riddles_game_ru/gen/colors.gen.dart';

class Themes {
  static const lightID = 'light';
  static const darkID = 'dark';

  ThemeData get light => ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade100),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey.shade200,
        ),
        textTheme: TextTheme(
          headline5: TextStyle(color: Colors.orange.shade900),
          bodyText1: const TextStyle(color: Colors.black54),
          headline6: const TextStyle(color: Color.fromARGB(255, 41, 127, 135)),
        ),
        primaryColor: const Color.fromARGB(255, 133, 140, 143).withOpacity(.9),
        iconTheme: const IconThemeData(color: ColorName.black),
        cardColor: ColorName.white,
        hintColor: Colors.grey.shade600,
        errorColor: ColorName.black,
        disabledColor: const Color.fromARGB(255, 235, 235, 235),
        focusColor: const Color.fromARGB(96, 240, 240, 240),
        canvasColor: const Color.fromARGB(255, 183, 195, 198),
        hoverColor: Colors.blueGrey.shade50,
        shadowColor: Colors.blueGrey.shade50,
      );

  ThemeData get dark => ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 34, 34, 34),
        appBarTheme:
            const AppBarTheme(backgroundColor: Color.fromARGB(255, 34, 34, 34)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 34, 34, 34),
        ),
        textTheme: const TextTheme(
          headline5: TextStyle(color: Colors.orange),
          bodyText1: TextStyle(color: ColorName.grey),
          headline6: TextStyle(color: Color.fromARGB(255, 41, 127, 135)),
        ),
        primaryColor: const Color.fromARGB(255, 56, 58, 58).withOpacity(.9),
        iconTheme: const IconThemeData(color: ColorName.black),
        cardColor: Colors.grey.shade800,
        hintColor: Colors.grey.shade600,
        errorColor: Colors.white54,
        disabledColor: const Color.fromARGB(96, 152, 152, 152),
        focusColor: Colors.black38,
        canvasColor: const Color.fromARGB(255, 62, 66, 67),
        hoverColor: const Color.fromARGB(255, 90, 96, 98).withOpacity(.5),
        shadowColor: const Color.fromARGB(255, 155, 155, 155).withOpacity(.3),
      );
}
