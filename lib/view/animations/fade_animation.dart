import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../riddles_games_ru.dart';

class FadeInDownAnimation extends R2StatefulWidget {
  FadeInDownAnimation(
      {Key? key,
      required this.delay,
      required this.child,
      this.duration = 500,
      this.from = 50})
      : super(key: key);
  final Widget child;
  final double from;
  final int delay;
  final int duration;
  @override
  State<FadeInDownAnimation> createState() => _FadeInDownAnimationState();
}

class _FadeInDownAnimationState extends R2State<FadeInDownAnimation> {
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
        from: widget.from,
        delay: Duration(milliseconds: widget.delay),
        duration: Duration(milliseconds: widget.duration),
        child: widget.child);
  }
}

class FadeInLeftAnimation extends R2StatefulWidget {
  FadeInLeftAnimation(
      {Key? key,
      required this.delay,
      required this.child,
      this.duration = 500,
      this.from = 50})
      : super(key: key);
  final Widget child;
  final double from;
  final int delay;
  final int duration;
  @override
  State<FadeInLeftAnimation> createState() => _FadeInLeftAnimationState();
}

class _FadeInLeftAnimationState extends R2State<FadeInLeftAnimation> {
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
        from: widget.from,
        delay: Duration(milliseconds: widget.delay),
        duration: Duration(milliseconds: widget.duration),
        child: widget.child);
  }
}

class FadeInRightAnimation extends R2StatefulWidget {
  FadeInRightAnimation(
      {Key? key,
      required this.delay,
      required this.child,
      this.duration = 500,
      this.from = 50})
      : super(key: key);
  final Widget child;
  final double from;
  final int delay;
  final int duration;
  @override
  State<FadeInRightAnimation> createState() => _FadeInRightAnimationState();
}

class _FadeInRightAnimationState extends R2State<FadeInRightAnimation> {
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
        from: widget.from,
        delay: Duration(milliseconds: widget.delay),
        duration: Duration(milliseconds: widget.duration),
        child: widget.child);
  }
}
