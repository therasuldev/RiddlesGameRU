import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riddles_game_ru/view/game/widgets/pinput_widget.dart';

import '../../../riddles_games_ru.dart';

class GameAnswersCard extends R2StatefulWidget {
  GameAnswersCard({
    super.key,
    required this.controller,
    required this.score,
    required this.question,
    required this.stateColor,
    required this.nextPressed,
    required this.helperPressed,
    required this.allQuestion,
    required this.fieldsCount,
  });
  final Color stateColor;
  final int score;
  final int question;
  final int allQuestion;
  final int fieldsCount;
  final TextEditingController controller;
  final void Function()? nextPressed;
  final void Function()? helperPressed;

  @override
  State<GameAnswersCard> createState() => _GameAnswersCardState();
}

class _GameAnswersCardState extends R2State<GameAnswersCard>
    with DecorationMixin, WidgetMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .15,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      color: Theme.of(context).cardColor.withOpacity(.9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50,
            child: PinPut(
              textStyle: TextStyle(
                  color: Theme.of(context)
                      .errorColor
                      .withBlue(200)
                      .withGreen(200)),
              withCursor: true,
              eachFieldWidth: 35,
              eachFieldHeight: 50,
              controller: widget.controller,
              fieldsCount: widget.fieldsCount,
              keyboardType: TextInputType.text,
              preFilledWidget: _preFilledWidget(),
              eachFieldAlignment: Alignment.center,
              fieldsAlignment: MainAxisAlignment.center,
              submittedFieldDecoration: _submittedFieldDecoration(),
              followingFieldDecoration: _followingFieldDecoration(),
              eachFieldConstraints: const BoxConstraints(maxWidth: 35),
              onSubmit: (v) => setState(() => widget.controller.text = v),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _scoreTextWidget(),
                  _scoreWidget(),
                  const Spacer(),
                  _nextQButton(),
                  const Spacer(flex: 2),
                  _helperButton(),
                  const Spacer(),
                  Text(
                    '${widget.question}/${widget.allQuestion}',
                    style: R2Typography.questions.orangeAccent.size25,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

mixin DecorationMixin on R2State<GameAnswersCard> {
  BoxDecoration _submittedFieldDecoration() {
    return BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(.9),
        image: DecorationImage(image: AssetImage(Assets.png.pentagon.path)));
  }

  BoxDecoration _followingFieldDecoration() {
    return BoxDecoration(
        image: DecorationImage(image: AssetImage(Assets.png.pentagon.path)));
  }
}

mixin WidgetMixin on R2State<GameAnswersCard> {
  Widget _scoreTextWidget() {
    return Text(
      ridd.fmt(context, 'score.text'),
      style: R2Typography.scorText.size22.copyWith(color: widget.stateColor),
    );
  }

  Widget _scoreWidget() {
    return AnimatedDigitWidget(
      value: widget.score,
      textStyle: R2Typography.scor.orangeWithGreen.size20,
    );
  }

  Widget _nextQButton() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: widget.nextPressed,
      child: SizedBox(
        height: 27,
        width: 27,
        child: Image.asset(Assets.png.next.path),
      ),
    );
  }

  Widget _helperButton() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: widget.helperPressed,
      child: const Icon(Icons.help, size: 32, color: ColorName.grey),
    );
  }

  Widget _preFilledWidget() {
    return Card(
      elevation: 0.5,
      child: Container(
        width: 35,
        height: 35,
        color: Theme.of(context).shadowColor.withBlue(255),
      ),
    );
  }
}
