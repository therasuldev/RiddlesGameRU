import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riddles_game_ru/core/service/ads/admob_service.dart';
import 'package:riddles_game_ru/core/utils/enum.dart';
import 'package:riddles_game_ru/core/utils/logger.dart';
import 'package:riddles_game_ru/view/animations/loading_widget.dart';
import 'package:riddles_game_ru/view/utils/utils.dart';

import '../../../core/provider/bloc/user/user_bloc.dart';
import '../../../riddles_games_ru.dart';
import '../profile.dart';

class Profile extends R2StatefulWidget {
  Profile({super.key, this.displayName});
  final String? displayName;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends R2State<Profile> {
  final _userController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(UserGet());
    _adManager = AdManager();
    super.initState();
  }

  late AdManager _adManager;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            UserNameCardWidget(controller: _userController),
            UserScoreCardWidget(),
          ],
        ),
        ViewUtils.defaultSizedBox,
        AdCardWidget(adManager: _adManager),
      ],
    );
  }
}

class AdCardWidget extends R2StatelessWidget {
  AdCardWidget({
    super.key,
    required AdManager adManager,
  }) : _adManager = adManager;

  final AdManager _adManager;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
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
                  style: R2Typography.info.lightBlueGray.size22,
                ),
                const Spacer(),
                AdButton(adManager: _adManager)
              ],
            ),
          ),
        ),
        ViewUtils.defaultSizedBox,
        ChangeAppTheme(),
        ViewUtils.defaultSizedBox,
        ChangeAppLanguage(),
        ViewUtils.defaultSizedBox,
        RateAndShareWidget(),
      ],
    );
  }
}

class AdButton extends R2StatefulWidget {
  AdButton({
    super.key,
    required this.adManager,
  });
  final AdManager adManager;

  @override
  State<AdButton> createState() => _AdButtonState();
}

class _AdButtonState extends State<AdButton> {
  bool isLoading = false;

  void _watchRewardedAd() async {
    setState(() => isLoading = true);
    widget.adManager.loadRewardedAd();
    await Future.delayed(Duration(seconds: Durations.one.delay));
    setState(() => isLoading = false);
    try {
      if (context.mounted) {
        widget.adManager.showRewardedAd(context);
      }
    } catch (e) {
      Log.d(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: _watchRewardedAd,
      child: SizedBox(
        height: 45,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(Assets.png.play.path),
            Visibility(visible: isLoading, child: LoadingWidget())
          ],
        ),
      ),
    );
  }
}

