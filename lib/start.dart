import 'package:flutter/material.dart';
import 'package:riddles_game_ru/gen/assets.gen.dart';
import 'package:riddles_game_ru/view/game/page/game_page.dart';
import 'package:riddles_game_ru/view/home/view/home_view.dart';
import 'package:riddles_game_ru/view/home/widgets/home_riddle_appbar.dart';
import 'package:riddles_game_ru/view/profile/view/profile_view.dart';
import 'package:riddles_game_ru/view/widgets/widgets.dart';

import 'view/game/widgets/game_view_appbar_widget.dart';
import 'view/profile/widgets/profile_appbar.dart';

class Start extends R2StatefulWidget {
  Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends R2State<Start> {
  final _controller = PageController();
  int _pageIndex = 0;

  final List<Widget> _pages = [
    CategoryGridViewBuilder(),
    GamesView(),
    Profile()
  ];

  void _pageChanged(int index) {
    _pageIndex = index;
    setState(() {});
  }

  void _bottomTapped(int index) {
    _pageIndex = index;
    _controller.animateToPage(
      _pageIndex,
      duration: const Duration(milliseconds: 700),
      curve: Curves.ease,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _riddleAppBar(_pageIndex),
        body: PageView(
          controller: _controller,
          children: [..._pages],
          onPageChanged: (value) => _pageChanged(value),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          items: _bottomNavigationBarItem,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          onTap: (value) => _bottomTapped(value),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> get _bottomNavigationBarItem {
    return [
      BottomNavigationBarItem(
          icon: Image.asset(
            Assets.png.home.path,
            color: _iconColor(_pageIndex == 0),
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Image.asset(
            Assets.png.game.path,
            color: _iconColor(_pageIndex == 1),
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: Image.asset(
            Assets.png.person.path,
            color: _iconColor(_pageIndex == 2),
          ),
          label: '')
    ];
  }

  _riddleAppBar(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: HomeViewAppBar(),
        );

      case 1:
        return PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: GameViewAppBar(),
        );

      case 2:
        return PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: ProfileViewAppBar(),
        );
    }
  }

  Color? _iconColor(bool isSelected) {
    if (isSelected) {
      return Theme.of(context).colorScheme.background.withGreen(160);
    }
    return null;
  }
}
