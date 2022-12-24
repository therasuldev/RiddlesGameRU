import 'dart:convert';

import 'package:flutter/services.dart';

import '../app/riddle.dart';
import '../service/riddles_service.dart';

class GameDB extends RiddlesService {
  final ridd = Riddle();
  final key = 'assets/data/game';

  @override
  Future<List<Map<String, dynamic>>> getRiddles(String category) async {
    return await ridd.cacheService.games.get(category);
  }

  @override
  Future<List<Map<String, dynamic>>> loadRiddles(String category) async {
    List<Map<String, dynamic>> riddles = [];
    var jsonStr = await rootBundle.loadString('$key/$category.json');
    Map<String, dynamic> jsonMap = json.decode(jsonStr);

    for (var i = 1; i <= jsonMap.length; i++) {
      riddles.add(jsonMap['$i']);
    }
    await ridd.cacheService.games.put(category, riddles);
    return await getRiddles(category);
  }
}
