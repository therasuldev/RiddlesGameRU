import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riddles_game_ru/core/provider/cubit/ads/ad_cubit.dart';
import 'package:riddles_game_ru/view/animations/loading_widget.dart';
import 'package:riddles_game_ru/view/utils/utils.dart';

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
            BlocListener<AdCubit, AdState>(
              listener: (context, state) {
                if (state is AdFailed) {
                  ViewUtils.snackBar(context, ridd.fmt(context, 'ad.title'));
                }
              },
              child: BlocBuilder<AdCubit, AdState>(
                builder: (context, state) {
                  if (state is AdLoad) return LoadingWidget();
                  return CupertinoButton(
                    onPressed: onPressed,
                    child: SizedBox(
                      height: 45,
                      child: Image.asset(Assets.png.play.path),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
