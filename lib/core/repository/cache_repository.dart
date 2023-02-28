import 'package:riddles_game_ru/core/app/riddle.dart';

class CacheRepository {
  final _ridd = Riddle();

// get and put riddles data

  Future<List<Map<String, dynamic>>> getRiddlesFromCache(dynamic value) async {
    return await _ridd.cacheService.riddles.get(value);
  }

  void putRiddlesToCache(dynamic key, dynamic value) async {
    await _ridd.cacheService.riddles.put(key, value);
  }

// get and put game riddles data

  Future<List<Map<String, dynamic>>> getGameRiddlesFromCache(
      dynamic value) async {
    return await _ridd.cacheService.games.get(value);
  }

  void putGameRiddlesToCache(dynamic key, dynamic value) async {
    await _ridd.cacheService.games.put(key, value);
  }
}
