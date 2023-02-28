enum Durations {
  low(100),
  high(300);

  final int delay;
  const Durations(this.delay);
}

enum DataPath {
  riddles,
  game;

  String getPath() {
    switch (this) {
      case DataPath.riddles:
        return 'assets/data/riddles';
      case DataPath.game:
        return 'assets/data/game';
    }
  }
}
