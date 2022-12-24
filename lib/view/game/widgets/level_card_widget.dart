import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riddles_game_ru/view/game/category/numbers.dart';

import '../../../core/provider/cubit/level/level_cubit.dart';
import '../../../riddles_games_ru.dart';

class LevelCard extends R2StatelessWidget {
  LevelCard({Key? key, required this.index, required this.levelCost})
      : super(key: key);
  final int index;
  final int levelCost;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 70,
        width: MediaQuery.of(context).size.width * 9,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Image.asset(numbers[index]),
                    Text(
                      ridd.fmt(context, 'dot'),
                      style: R2Typography.dot.size50.copyWith(
                        color: const Color.fromARGB(255, 182, 136, 132),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              if (index != 0)
                BlocBuilder<LevelCubit, LevelState>(
                  builder: (context, state) {
                    if (state.isSuccess) {
                      return _locked(state.levels.contains(index), context);
                    }
                    return const SizedBox.shrink();
                  },
                ),
              const SizedBox(width: 10),
              BlocBuilder<LevelCubit, LevelState>(
                builder: (context, state) {
                  if (state.isSuccess) {
                    return index == 0
                        ? Image.asset(Assets.png.unlock.path)
                        : _lockIcon(state.levels.contains(index));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _lockIcon(bool completed) {
    if (completed) {
      return Image.asset(Assets.png.unlock.path);
    }
    return Image.asset(Assets.png.locked.path);
  }

  Widget _locked(bool show, BuildContext context) {
    if (!show) {
      return Row(
        children: [
          Image.asset(Assets.png.money.path),
          const SizedBox(width: 5),
          Text(
            levelCost.toString(),
            style: R2Typography.money.orangeAccent.size22,
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}
