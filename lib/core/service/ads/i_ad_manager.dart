import 'package:flutter/material.dart';


abstract class IAdManager {
  void loadRewardedAd();
  void showRewardedAd(BuildContext context);

  void loadInterstitialAd();
  void showInterstitialAd();
}
