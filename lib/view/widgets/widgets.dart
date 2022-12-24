import 'package:flutter/material.dart';
import 'package:riddles_game_ru/core/app/riddle.dart';

abstract class R2StatelessWidget extends StatelessWidget {
  R2StatelessWidget({Key? key}) : super(key: key);
  final ridd = Riddle();
}

abstract class R2StatefulWidget extends StatefulWidget {
  R2StatefulWidget({Key? key}) : super(key: key);
  final ridd = Riddle();
}

abstract class R2State<B extends R2StatefulWidget> extends State<B> {
  final ridd = Riddle();
}
