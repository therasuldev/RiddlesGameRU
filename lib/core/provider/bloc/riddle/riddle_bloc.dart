import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riddles_game_ru/core/database/riddle_db.dart';
import 'package:riddles_game_ru/core/model/riddle_model/riddle_model.dart';

part 'riddle_event.dart';
part 'riddle_state.dart';

class RiddleBloc extends Bloc<RiddleEvent, RiddleState> {
  final db = RiddleDB();

  RiddleBloc() : super(RiddleState.initial()) {
    on<GetRiddles>(_onGetRiddles);
    on<AddRiddles>(_onAddRiddles);
  }
  _onGetRiddles(GetRiddles event, Emitter<RiddleState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      var allRidd = await db.getRiddles(event.category);
      var riddles = allRidd.map((json) => RiddleModel.fromJson(json)).toList();
      emit(state.copyWith(isSuccess: true, riddles: riddles));
    } catch (_) {}
  }

  _onAddRiddles(AddRiddles event, Emitter<RiddleState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await db.loadRiddles(event.category);
    } catch (_) {}
  }
}
