import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/provider/cubit/app/app_cubit.dart';
import '../../../riddles_games_ru.dart';

class ChangeAppLanguage extends R2StatefulWidget {
  ChangeAppLanguage({Key? key}) : super(key: key);

  @override
  State<ChangeAppLanguage> createState() => _ChangeAppLanguageState();
}

class _ChangeAppLanguageState extends R2State<ChangeAppLanguage> {
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
              onPressed: () => _cubit.changeLang('ru'),
              padding: EdgeInsets.zero,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  alignment: Alignment.center,
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
                        child: Image.asset(Assets.png.ru.path),
                      ),
                      Positioned(
                          top: -5,
                          right: -5,
                          child: Visibility(
                              visible: state.langCode == 'ru',
                              child: Image.asset(Assets.png.verified.path)))
                    ],
                  ),
                ),
              ),
            ),
            CupertinoButton(
              onPressed: () => _cubit.changeLang('en'),
              padding: EdgeInsets.zero,
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  alignment: Alignment.center,
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
                        child: Image.asset(Assets.png.en.path),
                      ),
                      Positioned(
                          top: -5,
                          right: -5,
                          child: Visibility(
                              visible: state.langCode == 'en',
                              child: Image.asset(Assets.png.verified.path)))
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
