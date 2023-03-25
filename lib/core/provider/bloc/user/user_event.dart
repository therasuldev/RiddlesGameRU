part of 'user_bloc.dart';

class UserEvent {}

class UserAdd extends UserEvent {
  final UserModel user;

  UserAdd({required this.user});
}

class UserGet extends UserEvent {}

//class RemoveUser extends UserEvent {}
