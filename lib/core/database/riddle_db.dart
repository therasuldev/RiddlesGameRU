import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riddles_game_ru/core/interface/i_riddles_repository.dart';
import 'package:riddles_game_ru/core/repository/cache_repository.dart';

class RiddleRepository extends IRiddlesRepository {
  final CacheRepository _cahceRepo;
  final String _path;
  RiddleRepository({
    required CacheRepository cahceRepo,
    required String path,
  })  : _cahceRepo = cahceRepo,
        _path = path;

  @override
  Future<List<Map<String, dynamic>>> getRiddles(String category) async {
    return _cahceRepo.getRiddlesFromCache(category);
  }

  @override
  Future<List<Map<String, dynamic>>> loadRiddles(String category) async {
    List<Map<String, dynamic>> riddles = [];

    var jsonStr = await rootBundle.loadString('$_path/$category.json');
    Map<String, dynamic> jsonMap = json.decode(jsonStr);

    for (var i = 1; i <= jsonMap.length; i++) {
      riddles.add(jsonMap['$i']);
    }

    _cahceRepo.putRiddlesToCache(category, riddles);

    return await getRiddles(category);
  }
}
