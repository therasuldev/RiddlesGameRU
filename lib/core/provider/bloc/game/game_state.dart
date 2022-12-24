part of 'game_bloc.dart';

class GameState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final List<RiddleModel> riddles;
  final int score;

  const GameState({
    required this.isLoading,
    required this.isSuccess,
    required this.riddles,
    required this.score,
  });

  GameState copyWith({
    bool? isLoading,
    bool? isSuccess,
    List<RiddleModel>? riddles,
    int? score,
  }) {
    return GameState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      riddles: riddles ?? this.riddles,
      score: score ?? this.score,
    );
  }

  GameState.initial()
      : this(
          isLoading: false,
          isSuccess: false,
          riddles: [],
          score: 0,
        );

  @override
  List<Object?> get props => [riddles, score];
}
