import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riddles_game_ru/core/app/theme.dart';
import 'package:riddles_game_ru/core/provider/bloc/user/user_bloc.dart';
import 'package:riddles_game_ru/core/provider/cubit/app/app_cubit.dart';
import 'package:riddles_game_ru/core/provider/cubit/level/level_cubit.dart';
import 'package:riddles_game_ru/view/utils/utils.dart';
import 'package:riddles_game_ru/view/widgets/appbar.dart';

import '../../../riddles_games_ru.dart';

class ProfileViewAppBar extends R2StatefulWidget {
  ProfileViewAppBar({Key? key}) : super(key: key);

  @override
  State<ProfileViewAppBar> createState() => _ProfileViewAppBarState();
}

class _ProfileViewAppBarState extends R2State<ProfileViewAppBar> {
  late UserBloc _userBloc;
  late AppCubit _appCubit;
  late LevelCubit _levelCubit;
  @override
  void initState() {
    _userBloc = BlocProvider.of<UserBloc>(context);
    _appCubit = BlocProvider.of<AppCubit>(context);
    _levelCubit = BlocProvider.of<LevelCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RiddleAppBar(
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        color: ColorName.transparent,
        margin: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              maxRadius: 18,
              backgroundColor: ColorName.transparent,
              backgroundImage: AssetImage(Assets.png.app.path),
            ),
            const Spacer(),
            Text(
              ridd.fmt(context, 'page.profile'),
              style: R2Typography.profile.blueGrayM.size22,
            ),
            const Spacer(),
            PopupMenuButton(
              color: Theme.of(context).cardColor,
              shape: _popUpMenuDecor(),
              icon: Image.asset(Assets.png.menu.path),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    children: [
                      const Icon(Icons.delete, color: ColorName.red),
                      const SizedBox(width: 10),
                      Text(
                        ridd.fmt(context, 'delete.account'),
                        style: R2Typography.deleteAcc.blueGrayM.size18,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.clear_all,
                        color: Color.fromARGB(255, 222, 183, 10),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        ridd.fmt(context, 'settings.cache'),
                        style: R2Typography.clearCache.blueGrayM.size18,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.exit_to_app, color: ColorName.grey),
                      const SizedBox(width: 10),
                      Text(
                        ridd.fmt(context, 'exit'),
                        style: R2Typography.exitText.blueGrayM.size18,
                      ),
                    ],
                  ),
                )
              ],
              onSelected: (value) async {
                switch (value) {
                  case 0:
                    return _deleteAccount(context);
                  case 1:
                    return _clearAllCache(context);
                  case 2:
                    return _exit(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> _deleteAccount(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return GenerateDialog(
          context: context,
          title: '${ridd.fmt(context, 'delete.account')} ?',
          cancelTitle: ridd.fmt(context, 'dialog.close'),
          actTitle: ridd.fmt(context, 'dialog.check'),
          onAct: () {
            _userBloc.add(RemoveUser());
            _levelCubit.removeLevels();
            Navigator.pop(context);
          },
        );
      },
    );
  }

  Future<void> _clearAllCache(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return GenerateDialog(
          context: context,
          title: ridd.fmt(context, 'info.title'),
          cancelTitle: ridd.fmt(context, 'dialog.close'),
          actTitle: ridd.fmt(context, 'dialog.check'),
          onAct: () {
            _clearCache();
            Navigator.pop(context);
          },
        );
      },
    );
  }

  Future<void> _exit(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return GenerateDialog(
          context: context,
          title: '${ridd.fmt(context, 'exit')} ?',
          cancelTitle: ridd.fmt(context, 'dialog.close'),
          actTitle: ridd.fmt(context, 'dialog.check'),
          onAct: () {
            return SystemNavigator.pop().then(
              (_) => Navigator.pop(context),
            );
          },
        );
      },
    );
  }

  RoundedRectangleBorder _popUpMenuDecor() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
    );
  }

  void _clearCache() async {
    _appCubit.changeLang('ru');
    _appCubit.changeTheme(Themes.lightID);
    _levelCubit.removeLevels();
    _userBloc.add(RemoveUser());
  }
}
