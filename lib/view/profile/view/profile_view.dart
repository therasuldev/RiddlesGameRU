import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    super.initState();
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
          children: [
            UserNameCardWidget(controller: _userController),
            UserScoreCardWidget(),
          ],
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
