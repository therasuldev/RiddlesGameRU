import 'package:flutter/material.dart';
import 'package:riddles_game_ru/core/routes/routes.dart';
import 'package:riddles_game_ru/view/game/view/game_view.dart';
import 'package:riddles_game_ru/view/riddles/view/riddle_view.dart';

class RouteService extends Routes with SlideAnimationRoute {
  @override
  void goRiddleViewPage(BuildContext context, String category) {
    slideAnimationRoute(
        context: context, route: RiddleView(category: category), back: true);
  }

  @override
  void goGameViewPage(BuildContext context, String category) {
    slideAnimationRoute(
        context: context, route: GameView(category: category), back: true);
  }
}

///[============================================================]

mixin SlideAnimationRoute {
  Future slideAnimationRoute(
      {required BuildContext context,
      required Widget route,
      required bool back}) {
    return Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          opaque: true,
          pageBuilder: (BuildContext context, _, __) => route,
          transitionDuration: const Duration(milliseconds: 200),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation =
                CurvedAnimation(curve: Curves.linear, parent: animation);
            return _slideAnimationRouteBuilder(animation, child);
          },
        ),
        (route) => back);
  }

  Widget _slideAnimationRouteBuilder(
      Animation<double> animation, Widget child) {
    return Align(
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(.0, 1.0), end: Offset.zero)
            .animate(animation),
        child: child,
      ),
    );
  }
}
