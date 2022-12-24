import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riddles_game_ru/core/provider/cubit/app/app_cubit.dart';

import '../../../riddles_games_ru.dart';

class RateAndShareWidget extends R2StatelessWidget {
  RateAndShareWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CupertinoButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.height * .15,
                  child: Image.asset(Assets.png.rate.path),
                ),
              ),
            ),
            CupertinoButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.height * .15,
                  child: Image.asset(Assets.png.share.path),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
