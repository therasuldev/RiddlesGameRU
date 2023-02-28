import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:riddles_game_ru/core/app/riddle.dart';
import 'package:riddles_game_ru/gen/assets.gen.dart';
import 'package:store_redirect/store_redirect.dart';

class RateApp {
  RateApp._();
  static RatingDialog ratingDialog(BuildContext context) {
    return RatingDialog(
      initialRating: 5.0,
      title: const Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      image: Image.asset(
        Assets.png.app.path,
        height: MediaQuery.of(context).size.height * .2,
      ),
      submitButtonText: Riddle().fmt(context, 'comment.submit'),
      commentHint: Riddle().fmt(context, 'comment.hint'),
      onSubmitted: (_) {
        StoreRedirect.redirect(androidAppId: "com.riddle.game.en");
      },
    );
  }
}
