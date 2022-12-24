import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:riddles_game_ru/core/database/user_db.dart';

import '../../../model/user/user.dart';

part "user_event.dart";
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final db = UserDB();
  UserBloc() : super(UserState.empty()) {
    on<UserAdd>(_onUserAdd);
    on<UserGet>(_onUserGet);
    on<RemoveUser>(_onRemoveUser);
  }
  _onUserGet(UserGet event, Emitter<UserState> emit) async {
    var user = await db.getUser();
    emit(state.copyWith(isSuccess: true, user: user));
  }

  _onUserAdd(UserAdd event, Emitter<UserState> emit) async {
    var user = await db.addUser(event.user);
    emit(state.copyWith(isSuccess: true, user: user));
  }

  _onRemoveUser(RemoveUser event, Emitter<UserState> emit) async {
    await db.deleteUser();
    emit(state.copyWith(isSuccess: true, user: UserModel(name: '', score: 0)));
  }
}
