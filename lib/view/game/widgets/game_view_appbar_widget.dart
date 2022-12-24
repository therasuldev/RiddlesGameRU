import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riddles_game_ru/core/provider/bloc/user/user_bloc.dart';
import 'package:riddles_game_ru/view/game/category/numbers.dart';

import '../../../core/provider/cubit/level/level_cubit.dart';
import '../../../riddles_games_ru.dart';
import '../../widgets/appbar.dart';

class GameViewAppBar extends R2StatefulWidget {
  GameViewAppBar({Key? key}) : super(key: key);

  @override
  State<GameViewAppBar> createState() => _GameViewAppBarState();
}

class _GameViewAppBarState extends R2State<GameViewAppBar> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(UserGet());
  }

  @override
  Widget build(BuildContext context) {
    return RiddleAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            BlocBuilder<LevelCubit, LevelState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Image.asset(numbers[state.levels.length], scale: 1.5),
                    Text(
                      ridd.fmt(context, 'slash'),
                      style: R2Typography.level.grey.size22,
                    ),
                    Image.asset(numbers.last, scale: 1.2),
                  ],
                );
              },
            ),
            const Spacer(),
            Text(
              ridd.fmt(context, 'page.game'),
              style: R2Typography.game.blueGray.size22,
            ),
            const Spacer(),
            Image.asset(Assets.png.money.path, height: 30),
            const SizedBox(width: 3),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state.isSuccess) {
                  return Text(
                    state.user.score.toString(),
                    style: R2Typography.userScor.orangeAccent.size22,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
