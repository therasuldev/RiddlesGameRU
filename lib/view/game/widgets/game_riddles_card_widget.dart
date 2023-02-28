import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:riddles_game_ru/core/provider/cubit/app/app_cubit.dart';

import '../../../riddles_games_ru.dart';

class GameRiddlesCard extends R2StatelessWidget {
  GameRiddlesCard({
    Key? key,
    required this.result,
    required this.riddle,
  }) : super(key: key);

  final bool result;
  final String riddle;
  final String winnerCoin = '+50';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .81,
      width: MediaQuery.of(context).size.width,
      decoration: RiddleShowCardDecor(color: Theme.of(context).cardColor),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(top: 0, right: -50, child: _defaultSvg1(context)),
          Positioned(left: -100, top: 70, child: _defaultSvg2(context)),
          Positioned(top: 1, child: _gameRiddlesContainer(context, riddle)),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            top: 0,
            child: Visibility(
              visible: result,
              child: Center(child: Lottie.asset(Assets.lotties.winner)),
            ),
          ),
          Visibility(
            visible: result,
            child: Text(
              winnerCoin,
              style: R2Typography.winnerCoin.orangeAccent.size50,
            ),
          )
        ],
      ),
    );
  }

  Widget _gameRiddlesContainer(BuildContext context, String riddle) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height * .74,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: AutoSizeText(
            riddle,
            textAlign: TextAlign.center,
            style: GoogleFonts.balsamiqSans(
              textStyle: Theme.of(context).textTheme.titleLarge,
              color: state.themeName == "light"
                  ? Theme.of(context).primaryColor
                  : Colors.grey.shade400,
            ),
          ),
        );
      },
    );
  }

  Widget _defaultSvg1(BuildContext context) {
    return SvgPicture.asset(
      Assets.svg.bcg,
      color: Theme.of(context).hoverColor,
    );
  }

  Widget _defaultSvg2(BuildContext context) {
    return SvgPicture.asset(
      Assets.svg.back,
      color: Theme.of(context).shadowColor,
    );
  }
}
