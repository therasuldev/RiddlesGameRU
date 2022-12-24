import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/model/user/user.dart';
import '../../../core/provider/bloc/user/user_bloc.dart';
import '../../../riddles_games_ru.dart';

class SignUpCard extends R2StatelessWidget {
  SignUpCard({
    Key? key,
    required TextEditingController userController,
  })  : _userController = userController,
        super(key: key);

  final TextEditingController _userController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        _textField(context),
        const SizedBox(height: 10),
        _createButton(context),
        const SizedBox(height: 10),
      ],
    );
  }

  void _createAccount(BuildContext context) {
    if (_userController.text.trim().length >= 3 &&
        _userController.text.trim().length <= 12) {
      context.read<UserBloc>().add(
            UserAdd(
              user: UserModel(name: _userController.text.trim(), score: 300),
            ),
          );
    }
    _userController.clear();
    Navigator.pop(context);
  }

  Widget _createButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _createAccount(context),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(const Color.fromARGB(255, 109, 118, 118)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Text(ridd.fmt(context, 'button.create')),
      ),
    );
  }

  Widget _textField(BuildContext context) {
    return Card(
      elevation: 2,
      color: Theme.of(context).disabledColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: MediaQuery.of(context).size.height * .08,
        width: MediaQuery.of(context).size.height * .3,
        padding: const EdgeInsets.only(left: 10, top: 7),
        alignment: Alignment.center,
        child: TextField(
          style: R2Typography.hintUserName.black87.size14,
          controller: _userController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: ridd.fmt(context, 'user.name'),
            hintStyle: R2Typography.hintUserName.black54.size14,
            suffixIcon: const Icon(Icons.person, color: ColorName.grey),
          ),
        ),
      ),
    );
  }
}
