import 'package:flutter_test/flutter_test.dart';
import 'package:riddles_game_ru/core/app/intl.dart';
import 'package:riddles_game_ru/core/app/riddle.dart';
import 'package:riddles_game_ru/core/service/service.dart';


void main() {
  late Riddle ridd;

  setUpAll(() => ridd = Riddle());

  group('Riddle', () {
    test('is a singleton', () => expect(ridd.hashCode, Riddle().hashCode));

    test('has expected default property values', () {
      expect(ridd, isA<Riddle>());
      expect(ridd.runtimeType, Riddle);
    });

    test('has expected property and preference setting behavior', () {

      ridd.intl = Intl();
      ridd.cacheService = CacheService();
    

      expect(ridd.instances.isNotEmpty, true);
      expect(ridd.intl, isNotNull);
      expect(ridd.cacheService, isNotNull);
  
    });
  });
}
