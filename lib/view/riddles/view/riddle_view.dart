import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riddles_game_ru/core/database/riddle_db.dart';
import 'package:riddles_game_ru/core/provider/cubit/app/app_cubit.dart';
import 'package:riddles_game_ru/core/repository/cache_repository.dart';
import 'package:riddles_game_ru/view/animations/fade_animation.dart';
import 'package:riddles_game_ru/view/animations/loading_widget.dart';

import '../../../core/provider/bloc/riddle/riddle_bloc.dart';
import '../../../core/utils/enum.dart';
import '../../../riddles_games_ru.dart';
import '../riddles.dart';

class RiddleView extends R2StatefulWidget {
  RiddleView({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<RiddleView> createState() => _RiddleViewState();
}

class _RiddleViewState extends R2State<RiddleView> with RiddleViewMixin {
  late AppCubit _appCubit;

  @override
  void initState() {
    _appCubit = context.read<AppCubit>();
    BlocProvider.of<RiddleBloc>(context).add(GetRiddles(widget.category));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<RiddleBloc, RiddleState>(
          builder: (context, state) {
            if (state.isSuccess) {
              return Column(
                children: [
                  RiddlesCard(
                    childRid: FadeInDownAnimation(
                      delay: Durations.low.delay,
                      child: AutoSizeText(
                        state.riddles[_startIndex].riddle,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.balsamiqSans(
                          color: _appCubit.state.themeName == "light"
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade400,
                          textStyle: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    childAns: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width * .85,
                      decoration:
                          AnswerCardDecor(color: Theme.of(context).cardColor),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Answer(
                            answer: state.riddles[_startIndex].answer,
                            showText: _showText,
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: _showAnswer,
                              icon: _showText
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              iconSize: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FadeInLeftAnimation(
                        delay: Durations.low.delay,
                        child: ChangeQuestionButton(
                          img: Assets.png.back.path,
                          onTap: () => _previousQuestion(widget.category),
                        ),
                      ),
                      Text(
                        '${_startIndex + 1}/${state.riddles.length}',
                        style: R2Typography.info.blueGray.size25,
                      ),
                      FadeInRightAnimation(
                        delay: Durations.low.delay,
                        child: ChangeQuestionButton(
                          img: Assets.png.next.path,
                          onTap: () async {
                            await _nextQuestion(widget.category);
                          },
                        ),
                      ),
                    ],
                  )
                ],
              );
            }
            return LoadingWidget();
          },
        ),
      ),
    );
  }
}

mixin RiddleViewMixin on R2State<RiddleView> {
  int _startIndex = 0;
  bool _showText = false;

  final _db = RiddleRepository(
    cahceRepo: CacheRepository(),
    path: DataPath.riddles.getPath(),
  );

  Future<int> _nextQuestion(String category) async {
    var q = await _db.getRiddles(category);

    if (_startIndex < q.length - 1) {
      setState(() {
        _startIndex++;
        if (_showText) {
          setState(() => _showText = false);
        }
      });
    }

    return _startIndex;
  }

  int _previousQuestion(String category) {
    if (_startIndex > 0) {
      setState(() {
        _startIndex--;
        if (_showText) {
          setState(() => _showText = false);
        }
      });
    }

    return _startIndex;
  }

  void _showAnswer() {
    setState(() => _showText = !_showText);
  }
}
