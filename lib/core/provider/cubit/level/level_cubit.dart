import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riddles_game_ru/core/database/level_db.dart';

part "level_state.dart";

class LevelCubit extends Cubit<LevelState> {
  LevelCubit() : super(LevelState.empty());
  final _db = LevelDB();

  void addLevel(int index) async {
    final levels = await _db.addLevel(index);
    emit(state.copyWith(isSuccess: true, levels: levels));
  }

  void getLevel() async {
    final levels = await _db.getLevel();
    emit(state.copyWith(isSuccess: true, levels: levels));
  }

  void removeLevels() async {
    final levels = await _db.removeLevels();
    emit(state.copyWith(isSuccess: true, levels: levels));
  }
}
