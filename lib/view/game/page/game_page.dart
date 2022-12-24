import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riddles_game_ru/core/model/user/user.dart';
import 'package:riddles_game_ru/core/provider/bloc/user/user_bloc.dart';
import 'package:riddles_game_ru/core/provider/cubit/level/level_cubit.dart';
import 'package:riddles_game_ru/core/routes/route_service.dart';
import 'package:riddles_game_ru/view/game/category/game_categories.dart';
import 'package:riddles_game_ru/view/game/category/numbers.dart';
import 'package:riddles_game_ru/view/utils/utils.dart';

import '../../../core/provider/bloc/game/game_bloc.dart';
import '../../../riddles_games_ru.dart';
import '../game.dart';

class GamesView extends R2StatefulWidget {
  GamesView({super.key});

  @override
  State<GamesView> createState() => _GamesViewState();
}

class _GamesViewState extends R2State<GamesView> {
  final _route = RouteService();
  int _finalScore = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(UserGet());
    BlocProvider.of<LevelCubit>(context).getLevel();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: gameCategories.length,
          controller: ScrollController(),
          itemBuilder: (_, index) => GestureDetector(
            onTap: () async {
              final userState = context.read<UserBloc>().state;
              final levelState = context.read<LevelCubit>().state;
              context
                  .read<GameBloc>()
                  .add(AddGameRiddles(gameCategories[index]));

              if (!_userState()) {
                final msg = ridd.fmt(context, 'not.account');
                ViewUtils.snackBar(context, msg);
                return;
              }
              if (index == 0) {
                _route.goGameViewPage(context, gameCategories[index]);
                return;
              }
              if (!levelState.levels.contains(index)) {
                _startNewLevel(context, index, userState);
                return;
              }

              _route.goGameViewPage(context, gameCategories[index]);
            },
            child: LevelCard(index: index, levelCost: levelCost(index)),
          ),
        ),
      ],
    );
  }

  Future<void> _startNewLevel(
    BuildContext context,
    int index,
    UserState state,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).canvasColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.png.level.path),
                  const SizedBox(width: 10),
                  Image.asset(numbers[index])
                ],
              ),
              ViewUtils.defaultSizedBox,
              CupertinoButton(
                onPressed: () {
                  final msg = ridd.fmt(context, 'not.score');
                  if (!_scoreState(index)) {
                    Navigator.pop(context);
                    ViewUtils.snackBar(context, msg);
                    return;
                  }
                  _buyNewLevel(state, index);
                },
                color: Theme.of(context).focusColor,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(Assets.png.money.path),
                    const SizedBox(width: 10),
                    Text(
                      levelCost(index).toString(),
                      style: R2Typography.money.blueGrayM.size22,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  int levelCost(int index) {
    return 50 + (index * 50);
  }

  void _buyNewLevel(UserState state, int index) {
    _finalScore = state.user.score - levelCost(index);
    final user = UserModel(name: state.user.name, score: _finalScore);

    context.read<UserBloc>().add(UserAdd(user: user));
    Navigator.pop(context);

    Future.delayed(const Duration(milliseconds: 700)).then(
      (_) {
        context.read<LevelCubit>().addLevel(index);
        _route.goGameViewPage(context, gameCategories[index]);
      },
    );
  }

  bool _userState() {
    var state = context.read<UserBloc>().state;
    if (state.user.name.isEmpty) {
      return false;
    }
    return true;
  }

  bool _scoreState(int index) {
    var state = context.read<UserBloc>().state;
    if (state.user.score >= levelCost(index)) {
      return true;
    }
    return false;
  }
}
