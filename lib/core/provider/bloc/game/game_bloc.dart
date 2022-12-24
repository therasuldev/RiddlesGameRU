import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:riddles_game_ru/core/database/game_db.dart';

import '../../../model/riddle_model/riddle_model.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final db = GameDB();

  GameBloc() : super(GameState.initial()) {
    on<GetGameRiddles>(_onGetGameRiddles);
    on<AddGameRiddles>(_onAddGameRiddles);
  }
  void _onGetGameRiddles(GetGameRiddles event, Emitter<GameState> emit) async {
    emit(state.copyWith(isLoading: true, isSuccess: false));
    try {
      var allRidd = await db.getRiddles(event.category);
      var riddles = allRidd.map((json) => RiddleModel.fromJson(json)).toList();
      emit(state.copyWith(isLoading: false, isSuccess: true, riddles: riddles));
    } catch (_) {}
  }

  void _onAddGameRiddles(AddGameRiddles event, Emitter<GameState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await db.loadRiddles(event.category);
    } catch (_) {}
  }
}
