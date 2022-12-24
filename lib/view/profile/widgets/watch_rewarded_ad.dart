import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../riddles_games_ru.dart';

class WatchRewardedAd extends R2StatelessWidget {
  WatchRewardedAd({Key? key, required this.onPressed}) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * .12,
        width: MediaQuery.of(context).size.width * .9,
        margin: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Image.asset(Assets.png.money.path),
            Text(
              ridd.fmt(context, 'watch.ad'),
              style: R2Typography.scor.orangeAccent.size22,
            ),
            const Spacer(),
            Text(
              '0/5',
              style: R2Typography.info.orangeWithOpacity.size22,
            ),
            const Spacer(),
            CupertinoButton(
              onPressed: onPressed,
              child: SizedBox(
                height: 45,
                child: Image.asset(Assets.png.play.path),
              ),
            )
          ],
        ),
      ),
    );
  }
}
