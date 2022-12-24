import 'package:flutter/material.dart';
import '../../riddles_games_ru.dart';

class RiddleAppBar extends R2StatelessWidget {
  RiddleAppBar({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Theme.of(context).appBarTheme.backgroundColor,
      shape: const AppBarDecor(),
      child: Container(
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
