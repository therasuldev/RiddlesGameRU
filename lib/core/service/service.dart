import 'package:hive/hive.dart';
import 'package:riddles_game_ru/core/service/boxes.dart';

class CacheService {
  Box get riddles => Hive.box(Boxes.riddles);
  Box get games => Hive.box(Boxes.games);
  Box get user => Hive.box(Boxes.user);
  Box get levels => Hive.box(Boxes.levels);
  Box get apptheme => Hive.box(Boxes.apptheme);
  Box get applang => Hive.box(Boxes.applang);
}
