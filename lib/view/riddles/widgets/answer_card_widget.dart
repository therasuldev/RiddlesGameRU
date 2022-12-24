import 'package:flutter/material.dart';

import '../../../core/utils/enum.dart';
import '../../../riddles_games_ru.dart';
import '../../animations/fade_animation.dart';

class Answer extends R2StatelessWidget {
  Answer({Key? key, required this.showText, required this.answer})
      : super(key: key);

  final bool showText;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width * .7,
      alignment: Alignment.center,
      child: FadeInDownAnimation(
        delay: Durations.low.delay,
        child: AutoSizeText(
          showText ? answer : _hiddenAnswer(answer),
          textAlign: TextAlign.center,
          style: R2Typography.answer.blueGray.size20,
        ),
      ),
    );
  }

  String _hiddenAnswer(String answer) {
    String answ = '';
    for (var i = 0; i < answer.length; i++) {
      answ = '$answ*';
    }
    if (answ.length > 15) {
      return '${answ.substring(0, 15)}...';
    }
    return answ;
  }
}
