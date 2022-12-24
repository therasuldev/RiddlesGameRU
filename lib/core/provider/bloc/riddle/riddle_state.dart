part of 'riddle_bloc.dart';

class RiddleState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final List<RiddleModel> riddles;

  const RiddleState({
    required this.isLoading,
    required this.isSuccess,
    required this.riddles,
  });

  RiddleState copyWith({
    bool? isLoading,
    bool? isSuccess,
    List<RiddleModel>? riddles,
  }) {
    return RiddleState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      riddles: riddles ?? this.riddles,
    );
  }

  RiddleState.initial()
      : this(
          isLoading: false,
          isSuccess: false,
          riddles: [],
        );

  @override
  List<Object?> get props => [riddles];
}
