import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riddles_game_ru/core/app/theme.dart';
import 'package:riddles_game_ru/core/provider/cubit/app/app_cubit.dart';

import '../../../riddles_games_ru.dart';

class ChangeAppTheme extends R2StatefulWidget {
  ChangeAppTheme({Key? key}) : super(key: key);

  @override
  State<ChangeAppTheme> createState() => _ChangeAppThemeState();
}

class _ChangeAppThemeState extends R2State<ChangeAppTheme> {
  late AppCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<AppCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CupertinoButton(
              onPressed: () => _cubit.changeTheme(Themes.darkID),
              padding: EdgeInsets.zero,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.height * .15,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Image.asset(Assets.png.night.path),
                      ),
                      Positioned(
                        top: -5,
                        right: -5,
                        child: Visibility(
                          visible: state.themeName == Themes.darkID,
                          child: Image.asset(Assets.png.verified.path),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            CupertinoButton(
              onPressed: () => _cubit.changeTheme(Themes.lightID),
              padding: EdgeInsets.zero,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.height * .15,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Image.asset(Assets.png.day.path),
                      ),
                      Positioned(
                        top: -5,
                        right: -5,
                        child: Visibility(
                          visible: state.themeName == Themes.lightID,
                          child: Image.asset(Assets.png.verified.path),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
