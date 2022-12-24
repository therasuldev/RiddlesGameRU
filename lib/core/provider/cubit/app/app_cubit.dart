import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riddles_game_ru/core/app/riddle.dart';

import '../../../app/theme.dart';

part "app_state.dart";

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.empty);
  final _ridd = Riddle();
  final themes = {'dark': Themes().dark, 'light': Themes().light};

  Future<void> initApp() async {
    final lang = await currentLang;
    final themeName = await currentTheme;

    emit(state.copyWith(
      langCode: lang,
      themeName: themeName,
      theme: themes[themeName],
    ));
  }

  Future<void> changeTheme(dynamic newTheme) async {
    final service = _ridd.cacheService.apptheme;
    try {
      await service.put('apptheme', newTheme);
      emit(
        state.copyWith(
          theme: themes[newTheme] ?? themes['light'],
          themeName: newTheme,
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> changeLang(dynamic newLang) async {
    try {
      await _ridd.cacheService.applang.put('applang', newLang);
      emit(state.copyWith(langCode: newLang));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<String?> get currentTheme async {
    final service = _ridd.cacheService.apptheme;
    final appTheme = await service.get('apptheme');

    return appTheme ?? 'light';
  }

  Future<String?> get currentLang async {
    final appLang = await _ridd.cacheService.applang.get('applang');
    return appLang ?? 'ru';
  }
}
