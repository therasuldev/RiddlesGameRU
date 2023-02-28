import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/model/user/user.dart';
import '../../../core/provider/bloc/user/user_bloc.dart';
import '../../../riddles_games_ru.dart';

class WinnerDialogWidget extends R2StatefulWidget {
  WinnerDialogWidget({
    super.key,
    required this.finalScore,
    required this.score,
  });

  final int finalScore;
  final int score;

  @override
  State<WinnerDialogWidget> createState() => _WinnerDialogWidgetState();
}

class _WinnerDialogWidgetState extends R2State<WinnerDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: ColorName.transparent,
      content: Container(
        height: MediaQuery.of(context).size.height * .4,
        width: MediaQuery.of(context).size.width * .8,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(.8),
          borderRadius: BorderRadius.circular(15),
          border:
              Border.all(color: Theme.of(context).textTheme.titleLarge!.color!),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            Image.asset(Assets.png.winner.path),
            const Spacer(),
            _totalScore(context),
            const Spacer(),
            _closeButton(context),
            const Spacer()
          ],
        ),
      ),
    );
  }

  Widget _totalScore(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Text(
          ridd.fmt(context, 'winner.score'),
          style: R2Typography.finalScoreText.orange900.size25,
        ),
        Image.asset(Assets.png.money.path),
        Text(
          widget.score.toString(),
          style: R2Typography.finalScore.green.size30,
        ),
        const Spacer(),
      ],
    );
  }

  Widget _closeButton(BuildContext context) {
    return CupertinoButton(
      onPressed: () async {
        var user = context.read<UserBloc>().state.user;
        context.read<UserBloc>().add(
              UserAdd(
                user: UserModel(name: user.name, score: widget.finalScore),
              ),
            );

        Navigator.pop(context);
        Navigator.maybePop(context);
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * .5,
        color: Colors.green.shade600,
        alignment: Alignment.center,
        child:
            Text(ridd.fmt(context, 'ok'), style: R2Typography.ok.white.size25),
      ),
    );
  }
}
