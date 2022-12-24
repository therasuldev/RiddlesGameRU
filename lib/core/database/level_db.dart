import 'package:riddles_game_ru/core/app/riddle.dart';

class LevelDB {
  final _ridd = Riddle();
  addLevel(int index) async {
    await _ridd.cacheService.levels.put(index, index);
    return getLevel();
  }

  getLevel() async {
    final levels = _ridd.cacheService.levels.values.toList();
    return levels;
  }

  removeLevels() async {
    final keys = await _levelKeys();
    await _ridd.cacheService.levels.deleteAll(keys);
    return getLevel();
  }

  Future<Iterable<dynamic>> _levelKeys() async {
    return _ridd.cacheService.levels.keys;
  }
}
