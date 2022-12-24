import 'dart:async';

import 'package:flutter/material.dart';

import '../../riddles_games_ru.dart';

class TopModalSheet extends R2StatefulWidget {
  final Widget child;

  TopModalSheet({Key? key, required this.child}) : super(key: key);

  @override
  State<TopModalSheet> createState() => _TopModalSheetState();

  static show({required BuildContext context, required child}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => TopModalSheet(child: child),
            opaque: false));
  }
}

class _TopModalSheetState extends R2State<TopModalSheet>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  final GlobalKey _childKey = GlobalKey();

  dynamic get _childHeight {
    final renderBox = _childKey.currentContext!.findRenderObject() as RenderBox;
    return renderBox.size.height;
  }

  bool get _dismissUnderway =>
      _animationController.status == AnimationStatus.reverse;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    _animation = Tween<double>(begin: _isDirectionTop() ? -1 : 1, end: 0)
        .animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) Navigator.pop(context);
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_dismissUnderway) return;

    var change =
        details.primaryDelta! / (_childHeight ?? details.primaryDelta!);
    if (_isDirectionTop()) {
      _animationController.value += change;
    } else {
      _animationController.value -= change;
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_dismissUnderway) return;

    if (details.velocity.pixelsPerSecond.dy > 0 && _isDirectionTop()) return;
    if (details.velocity.pixelsPerSecond.dy < 0 && !_isDirectionTop()) return;

    if (details.velocity.pixelsPerSecond.dy > 700) {
      final double flingVelocity =
          -details.velocity.pixelsPerSecond.dy / _childHeight;
      if (_animationController.value > 0.0) {
        _animationController.fling(velocity: flingVelocity);
      }
    } else if (_animationController.value < 0.5) {
      if (_animationController.value > 0.0) {
        _animationController.fling(velocity: -1.0);
      }
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: onBackPressed,
      child: GestureDetector(
        onVerticalDragUpdate: _handleDragUpdate,
        onVerticalDragEnd: _handleDragEnd,
        excludeFromSemantics: true,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black38,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    key: _childKey,
                    children: <Widget>[
                      AnimatedBuilder(
                          animation: _animation,
                          builder: (context, _) {
                            return Transform(
                              transform: Matrix4.translationValues(
                                  0.0, width * _animation.value, 0.0),
                              child: SizedBox(
                                width: width,
                                child: GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () {},
                                    child: SizedBox(child: widget.child)),
                              ),
                            );
                          }),
                      const SizedBox(height: kToolbarHeight),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isDirectionTop() {
    return true;
  }

  Future<bool> onBackPressed() {
    _animationController.reverse();
    return Future<bool>.value(false);
  }
}

enum TopModalSheetDirection { top, bottom }
