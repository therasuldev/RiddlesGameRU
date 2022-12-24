import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:riddles_game_ru/riddles_games_ru.dart';

class MockBuildContext extends Mock implements BuildContext {}

class TestStatelessWidget extends R2StatelessWidget {
  TestStatelessWidget({Key? key}) : super(key: key);
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class TestStatefulWidget extends R2StatefulWidget {
  TestStatefulWidget({Key? key}) : super(key: key);
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class TestR2State extends R2StatefulWidget {
  TestR2State({Key? key}) : super(key: key);
  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
