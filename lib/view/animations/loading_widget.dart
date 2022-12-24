import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../riddles_games_ru.dart';

class LoadingWidget extends R2StatelessWidget {
  LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCircle(
      color: ColorName.blueGrey,
      size: 25,
    );
  }
}
