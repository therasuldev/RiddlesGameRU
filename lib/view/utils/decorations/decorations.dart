import 'package:flutter/material.dart';

import '../../../riddles_games_ru.dart';

class AppBarDecor extends RoundedRectangleBorder {
  const AppBarDecor()
      : super(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            side: const BorderSide(color: Colors.grey, width: 0));
}

class UserComponentsCardDecor extends BoxDecoration {
  const UserComponentsCardDecor({required Color color})
      : super(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        );
}

class TextFieldDecor extends InputDecoration {
  TextFieldDecor(BuildContext context, String hint)
      : super(
            hintText: hint,
            border: InputBorder.none,
            hintStyle: GoogleFonts.balsamiqSans(
              textStyle:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12),
            ),
            contentPadding: const EdgeInsets.only(left: 15));
}

class BuyScoreCardDecor extends RoundedRectangleBorder {
  BuyScoreCardDecor() : super(borderRadius: BorderRadius.circular(10));
}

class CategoryCardDecor extends BoxDecoration {
  final int index;
  final String img;
  CategoryCardDecor(this.index, this.img)
      : super(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
          image: DecorationImage(image: AssetImage(img)),
        );
}

class RiddleShowCardDecor extends BoxDecoration {
  RiddleShowCardDecor({required Color color})
      : super(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            border: Border.all(color: ColorName.brown, width: .5),
            color: color);
}

class AnswerCardDecor extends BoxDecoration {
  AnswerCardDecor({required Color color})
      : super(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: ColorName.brown),
            color: color);
}

class SettingsCard extends BoxDecoration {
  SettingsCard()
      : super(
            color: ColorName.grey.withOpacity(.2),
            borderRadius: BorderRadius.circular(10));
}

class SettingsDecor extends BoxDecoration {
  SettingsDecor({Color? color})
      : super(borderRadius: BorderRadius.circular(10), color: color);
}
