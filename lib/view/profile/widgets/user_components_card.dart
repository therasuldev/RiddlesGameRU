import 'package:flutter/material.dart';

import '../../../riddles_games_ru.dart';

class UserComponentsCard extends R2StatelessWidget {
  UserComponentsCard({
    Key? key,
    required this.text,
    required this.child,
    required this.color,
  }) : super(key: key);
  final Widget text;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                child: text,
              ),
              Container(
                decoration: UserComponentsCardDecor(color: color),
                height: MediaQuery.of(context).size.height * .08,
                width: MediaQuery.of(context).size.height * .3,
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.center,
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
