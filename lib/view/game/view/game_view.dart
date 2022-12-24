import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riddles_game_ru/core/provider/bloc/user/user_bloc.dart';
import 'package:riddles_game_ru/view/animations/loading_widget.dart';

import '../../../core/provider/bloc/game/game_bloc.dart';
import '../../../riddles_games_ru.dart';
import '../game.dart';

class GameView extends R2StatefulWidget {
  GameView({super.key, required this.category});
  final String category;

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends R2State<GameView> with GameViewMixin {
  @override
  void initState() {
    BlocProvider.of<GameBloc>(context).add(GetGameRiddles(widget.category));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder<GameBloc, GameState>(
            builder: (context, state) {
              if (state.isSuccess) {
                return Column(
                  children: [
                    GameAnswersCard(
                      score: _score,
                      controller: _controller,
                      stateColor: _stateColor,
                      question: _startIndex + 1,
                      helperPressed: _helperForAnswer,
                      nextPressed: _nextRiddleWithAnswer,
                      allQuestion: state.riddles.length,
                      fieldsCount: state.riddles[_startIndex].answer.length,
                    ),
                    GameRiddlesCard(
                      result: _result,
                      riddle: state.riddles[_startIndex].riddle,
                    ),
                  ],
                );
              }

              return LoadingWidget();
            },
          ),
        ),
      ),
    );
  }
}

mixin GameViewMixin on R2State<GameView> {
  int _score = 0;
  int _finalScore = 0;
  int _startIndex = 0;
  int _defaultIndex = 0;
  bool _result = false;
  Color _stateColor = ColorName.blueGrey;
  final _controller = TextEditingController();

  void _nextRiddleWithAnswer() {
    final state = BlocProvider.of<GameBloc>(context).state;
    final rightAnswer = state.riddles[_startIndex].answer.toLowerCase();
    final yourAnswer = _controller.text.toLowerCase();

    if (yourAnswer == rightAnswer) return answerRight();
    return answerFalse();
  }

  void answerRight() => setState(() {
        _result = true;
        _stateColor = ColorName.green;
        _controller.clear();
        _incrementScore();
        _incrementIndex();

        Future.delayed(const Duration(milliseconds: 1500)).then(
          (_) {
            if (mounted) {
              setState(() {
                _stateColor = ColorName.blueGrey;
                _result = false;
              });
            }
          },
        );
        _finalResultDialog();
      });

  void answerFalse() => setState(() {
        _stateColor = ColorName.red;
        _controller.clear();
        _decrementScore();
        _incrementIndex();

        Future.delayed(const Duration(seconds: 1)).then((_) => setState(() {
              _stateColor = ColorName.blueGrey;
            }));
        _finalResultDialog();
      });

  int _incrementIndex() {
    _defaultIndex++;
    if (_startIndex > 8) {
      return 0;
    }
    return _startIndex++;
  }

  int _incrementScore() {
    if (_defaultIndex > 9) {
      return _score += 0;
    }
    return _score += 50;
  }

  int _decrementScore() {
    if (_defaultIndex > 9) {
      return _score -= 0;
    } else if (_score == 10) {
      return _score = 0;
    } else if (_score > 0) {
      return _score -= 20;
    }
    return _score;
  }

  String _helperForAnswer() {
    final state = BlocProvider.of<GameBloc>(context).state;
    final answer = state.riddles[_startIndex].answer.toLowerCase();
    setState(() {
      List<String> letters = [];

      for (var i = 0; i < answer.length; i++) {
        letters.add(state.riddles[_startIndex].answer[i]);
        if (i.isEven) letters[i] = ' ';
      }
      var ans = '';
      for (var letter in letters) {
        ans += letter;
      }
      _controller.text = ans.toLowerCase();
    });
    return _controller.text;
  }

  _finalResultDialog() {
    final userBloc = context.read<UserBloc>().state;
    _finalScore = userBloc.user.score + _score;

    if (_defaultIndex == 10) {
      return showDialog<Widget>(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return WinnerDialogWidget(finalScore: _finalScore, score: _score);
        },
      );
    }
  }
}
