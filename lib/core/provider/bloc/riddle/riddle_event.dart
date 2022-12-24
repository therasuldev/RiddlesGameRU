part of 'riddle_bloc.dart';

abstract class RiddleEvent {}

class GetRiddles extends RiddleEvent {
  final String category;

  GetRiddles(this.category);
}

class AddRiddles extends RiddleEvent {
  final String category;
  AddRiddles(this.category);
}
