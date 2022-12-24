import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riddles_game_ru/core/app/riddle.dart';
import 'package:riddles_game_ru/core/service/riddles_service.dart';

class RiddleDB extends RiddlesService {
  final ridd = Riddle();
  final key = 'assets/data/riddles';

  @override
  Future<List<Map<String, dynamic>>> getRiddles(String category) async {
    return await ridd.cacheService.riddles.get(category);
  }

  @override
  Future<List<Map<String, dynamic>>> loadRiddles(String category) async {
    List<Map<String, dynamic>> riddles = [];
    var jsonStr = await rootBundle.loadString('$key/$category.json');
    Map<String, dynamic> jsonMap = json.decode(jsonStr);

    for (var i = 1; i <= jsonMap.length; i++) {
      riddles.add(jsonMap['$i']);
    }

    await ridd.cacheService.riddles.put(category, riddles);
    return await getRiddles(category);
  }
}
