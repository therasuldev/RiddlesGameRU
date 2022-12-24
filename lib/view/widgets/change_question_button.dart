import 'package:flutter/cupertino.dart';

import '../../riddles_games_ru.dart';

class ChangeQuestionButton extends R2StatelessWidget {
  ChangeQuestionButton({Key? key, required this.img, required this.onTap})
      : super(key: key);
  final String img;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        height: 60,
        width: 60,
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Image.asset(img),
      ),
    );
  }
}
