part of "level_cubit.dart";

class LevelState {
  final bool isSuccess;
  final List levels;
  LevelState({
    required this.isSuccess,
    required this.levels,
  });

  LevelState copyWith({
    bool? isSuccess,
    List? levels,
  }) {
    return LevelState(
      isSuccess: isSuccess ?? this.isSuccess,
      levels: levels ?? this.levels,
    );
  }

  LevelState.empty() : this(levels: [], isSuccess: false);
}
