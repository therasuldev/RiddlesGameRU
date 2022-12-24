import 'package:hive/hive.dart';

class CacheService {
  Box get riddles => Hive.box('riddles');
  Box get games => Hive.box('games');
  Box get user => Hive.box('User');
  Box get levels => Hive.box('levels');
  Box get apptheme => Hive.box('apptheme');
  Box get applang => Hive.box('applang');
}
