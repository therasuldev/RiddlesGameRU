import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:riddles_game_ru/core/provider/observer.dart';

import 'app.dart';
import 'core/app/intl.dart';
import 'core/app/riddle.dart';
import 'core/model/riddle_model/riddle_model.dart';
import 'core/model/user/user.dart';
import 'core/service/service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await path
      .getApplicationDocumentsDirectory()
      .then((directory) async => await Hive.initFlutter(directory.path));

  if (!(Hive.isAdapterRegistered(0) && Hive.isAdapterRegistered(1))) {
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(RiddleModelAdapter());
  }

  await Hive.openBox('riddles');
  await Hive.openBox('games');
  await Hive.openBox('levels');
  await Hive.openBox('User');
  await Hive.openBox('apptheme');
  await Hive.openBox('applang');

  Bloc.observer = R2BlocObserver();
  final ridd = Riddle();
  ridd.intl = Intl();
  ridd.cacheService = CacheService();
  ridd.intl.locale = const Locale('ru');
  ridd.intl.supportedLocales = languages;

  runApp(MyApp());
}
