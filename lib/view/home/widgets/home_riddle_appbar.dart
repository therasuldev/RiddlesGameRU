import 'package:flutter/material.dart';

import '../../../riddles_games_ru.dart';
import '../../widgets/appbar.dart';

class HomeViewAppBar extends R2StatelessWidget {
  HomeViewAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RiddleAppBar(
      child: Text(
        ridd.fmt(context, 'page.home'),
        style: R2Typography.riddles.blueGrayM.size22,
      ),
    );
  }
}
