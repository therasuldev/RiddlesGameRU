import 'package:flutter/material.dart';

import '../../riddles_games_ru.dart';

abstract class R2Typography {
  static TextStyle finalScoreText = GoogleFonts.balsamiqSans();
  static TextStyle finalScore = GoogleFonts.balsamiqSans();
  static TextStyle ok = GoogleFonts.balsamiqSans();

  static TextStyle scorText = GoogleFonts.balsamiqSans();
  static TextStyle scor = GoogleFonts.balsamiqSans();
  static TextStyle questions = GoogleFonts.balsamiqSans();
  static TextStyle answer = GoogleFonts.balsamiqSans();

  static TextStyle unlockLevel = GoogleFonts.balsamiqSans();
  static TextStyle userScor = GoogleFonts.balsamiqSans();

  static TextStyle level = GoogleFonts.balsamiqSans();
  static TextStyle money = GoogleFonts.balsamiqSans();
  static TextStyle winnerCoin = GoogleFonts.balsamiqSans();

  static TextStyle categories = GoogleFonts.balsamiqSans();

  static TextStyle newName = GoogleFonts.balsamiqSans();
  static TextStyle hintUserName = GoogleFonts.balsamiqSans();
  static TextStyle buttonText = GoogleFonts.balsamiqSans();
  static TextStyle info = GoogleFonts.balsamiqSans();

  static TextStyle deleteAcc = GoogleFonts.balsamiqSans();
  static TextStyle clearCache = GoogleFonts.balsamiqSans();
  static TextStyle exitText = GoogleFonts.balsamiqSans();

  static TextStyle riddles = GoogleFonts.balsamiqSans();
  static TextStyle game = GoogleFonts.balsamiqSans();
  static TextStyle profile = GoogleFonts.balsamiqSans();

  static TextStyle dot = GoogleFonts.balsamiqSans();
}

extension TextSizeExt on TextStyle {
  TextStyle get size50 => copyWith(fontSize: 50);
  TextStyle get size30 => copyWith(fontSize: 30);
  TextStyle get size25 => copyWith(fontSize: 25);
  TextStyle get size22 => copyWith(fontSize: 22);
  TextStyle get size20 => copyWith(fontSize: 20);
  TextStyle get size18 => copyWith(fontSize: 18);
  TextStyle get size16 => copyWith(fontSize: 16);
  TextStyle get size14 => copyWith(fontSize: 14);
}

extension TextColorExt on TextStyle {
  TextStyle get green => copyWith(color: ColorName.green);
  TextStyle get white => copyWith(color: ColorName.white);
  TextStyle get black87 => copyWith(color: Colors.black87);
  TextStyle get black54 => copyWith(color: Colors.black54);
  TextStyle get red900 => copyWith(color: Colors.red.shade900);
  TextStyle get teal => copyWith(color: Colors.teal.shade700);
  TextStyle get blueGrayM =>
      copyWith(color: const Color.fromARGB(255, 41, 127, 135));
  TextStyle get greyM =>
      copyWith(color: const Color.fromARGB(255, 173, 179, 182));
  TextStyle get grey =>
      copyWith(color: const Color.fromARGB(255, 138, 144, 144));
  TextStyle get orange900 => copyWith(color: Colors.orange.shade900);
  TextStyle get orangeAccent => copyWith(color: ColorName.orangeAccent);
  TextStyle get orangeWithGreen => copyWith(
        color: ColorName.orange.withGreen(150),
      );
  TextStyle get lightBlueGray => copyWith(
        color: Colors.blueGrey.shade300,
      );
  TextStyle get blueGray => copyWith(
        color: const Color.fromARGB(255, 41, 127, 135),
      );
  TextStyle get orangeWithOpacity => copyWith(
        color: ColorName.orangeAccent.withOpacity(.5),
      );
}

extension TextFontWeightExt on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
}
