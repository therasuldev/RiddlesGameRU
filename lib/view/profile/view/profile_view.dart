import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riddles_game_ru/core/model/user/user.dart';
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
  // BannerAd? _bannerAd;
  // RewardedAd? _rewardedAd;
  // int _rewardedScore = 0;

  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(UserGet());
    super.initState();
    // _createBannerAd();
    //_createRewardedAd();
  }

  _update(UserState state) {
    var uC = _userController.text.trim();
    if (uC.length > 3 && uC.length < 12) {
      context.read<UserBloc>().add(
            UserAdd(user: UserModel(name: uC, score: state.user.score)),
          );
      _userController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [_userNameCard(context), _scoreCard(context)],
        ),
        ViewUtils.defaultSizedBox,
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state.isSuccess) {
              if (state.user.name.isNotEmpty) {
                return _isRegistered();
              }
              return _isNotRegistered();
            }
            return LoadingWidget();
          },
        ),
      ],
    );
  }

  Widget _isNotRegistered() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: MediaQuery.of(context).size.height * .53,
      width: MediaQuery.of(context).size.width * .95,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width * .9,
            decoration:
                UserComponentsCardDecor(color: Theme.of(context).hoverColor),
            alignment: Alignment.center,
            child: AutoSizeText(
              ridd.fmt(context, 'signin.title'),
              textAlign: TextAlign.center,
              style: R2Typography.info.greyM.size16,
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(Assets.png.user.path),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 109, 118, 118),
              ),
            ),
            onPressed: _createAccount,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Text(
                ridd.fmt(context, 'button.text'),
                style: R2Typography.buttonText.white.size14,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _isRegistered() {
    return Column(
      children: [
        WatchRewardedAd(onPressed: () {}),
        ViewUtils.defaultSizedBox,
        ChangeAppTheme(),
        ViewUtils.defaultSizedBox,
        ChangeAppLanguage(),
        ViewUtils.defaultSizedBox,
        RateAndShareWidget(),
      ],
    );
  }

  _createAccount() => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: Container(
              decoration:
                  UserComponentsCardDecor(color: Theme.of(context).cardColor),
              child: SignUpCard(userController: _userController),
            ),
          );
        },
      );

  Widget _userNameCard(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.isSuccess) {
          return UserComponentsCard(
            text: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.user.name.isEmpty
                      ? ridd.fmt(context, 'user.name')
                      : state.user.name.toLowerCase(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: R2Typography.scorText.blueGray.size22,
                ),
                const SizedBox(width: 5),
                Visibility(
                  visible: state.user.name.isEmpty,
                  child: SizedBox(
                      height: 35,
                      width: 35,
                      child: Image.asset(Assets.png.lock.path)),
                )
              ],
            ),
            color: Theme.of(context).hoverColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: TextField(
                    controller: _userController,
                    enabled: state.user.name.isNotEmpty,
                    style: R2Typography.newName.grey.size14,
                    decoration:
                        TextFieldDecor(context, ridd.fmt(context, "edit.name")),
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => _update(state),
                  child: const Icon(Icons.check, color: ColorName.green),
                )
              ],
            ),
          );
        }
        return LoadingWidget();
      },
    );
  }

  Widget _scoreCard(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.isSuccess) {
          return UserComponentsCard(
            text: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ridd.fmt(context, 'user.score'),
                  style: R2Typography.scorText.blueGray.size22,
                ),
                const SizedBox(width: 5),
                Visibility(
                  visible: state.user.name.isEmpty,
                  child: SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset(Assets.png.lock.path),
                  ),
                )
              ],
            ),
            color: Theme.of(context).hoverColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.png.money.path, height: 25, width: 25),
                const SizedBox(width: 5),
                Text(
                  state.user.score.toString(),
                  style: R2Typography.scor.orangeAccent.size25,
                ),
              ],
            ),
          );
        }
        return LoadingWidget();
      },
    );
  }
}
