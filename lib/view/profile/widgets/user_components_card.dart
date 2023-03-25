import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riddles_game_ru/core/model/user/user.dart';
import 'package:riddles_game_ru/core/provider/bloc/user/user_bloc.dart';
import 'package:riddles_game_ru/core/utils/extension.dart';
import 'package:riddles_game_ru/gen/assets.gen.dart';
import 'package:riddles_game_ru/gen/colors.gen.dart';
import 'package:riddles_game_ru/view/animations/loading_widget.dart';
import 'package:riddles_game_ru/view/utils/decorations/decorations.dart';
import 'package:riddles_game_ru/view/widgets/widgets.dart';

class UserNameCardWidget extends R2StatefulWidget {
  UserNameCardWidget({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  State<UserNameCardWidget> createState() => _UserNameCardWidgetState();
}

class _UserNameCardWidgetState extends R2State<UserNameCardWidget> {
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(UserGet());
    super.initState();
  }

  _updateUserName(UserState state) {
    final ctrlVal = widget.controller.text.trim();
    if (ctrlVal.length > 3 && ctrlVal.length < 12) {
      final user = UserModel(name: ctrlVal, score: state.user.score);
      context.read<UserBloc>().add(UserAdd(user: user));
      widget.controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.isSuccess) {
          return Expanded(
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.height * .3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .12,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.user.name.isEmpty
                                ? ridd.fmt(context, 'user.name')
                                : state.user.name.toLowerCase(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: R2Typography.scorText.lightBlueGray.size22,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: UserComponentsCardDecor(
                        color: Theme.of(context).hoverColor,
                      ),
                      height: MediaQuery.of(context).size.height * .08,
                      width: MediaQuery.of(context).size.height * .3,
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: TextField(
                              controller: widget.controller,
                              style: R2Typography.newName.grey.size14,
                              decoration: TextFieldDecor(
                                context,
                                ridd.fmt(context, "edit.name"),
                              ),
                            ),
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () => _updateUserName(state),
                            child:
                                const Icon(Icons.check, color: ColorName.green),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return LoadingWidget();
      },
    );
  }
}

class UserScoreCardWidget extends R2StatefulWidget {
  UserScoreCardWidget({Key? key}) : super(key: key);

  @override
  State<UserScoreCardWidget> createState() => _UserScoreCardWidgetState();
}

class _UserScoreCardWidgetState extends R2State<UserScoreCardWidget> {
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(UserGet());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state.isSuccess) {
          return Expanded(
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.height * .3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .12,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ridd.fmt(context, 'user.score'),
                            style: R2Typography.scorText.lightBlueGray.size22,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: UserComponentsCardDecor(
                        color: Theme.of(context).hoverColor,
                      ),
                      height: MediaQuery.of(context).size.height * .08,
                      width: MediaQuery.of(context).size.height * .3,
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(Assets.png.money.path,
                              height: 25, width: 25),
                          const SizedBox(width: 5),
                          Text(
                            state.user.score.toString(),
                            style: R2Typography.scor.orangeAccent.size25,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return LoadingWidget();
      },
    );
  }
}
