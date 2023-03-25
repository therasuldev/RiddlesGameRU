import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:riddles_game_ru/core/constant/constant.dart';
import 'package:riddles_game_ru/core/model/user/user.dart';
import 'package:riddles_game_ru/core/provider/bloc/user/user_bloc.dart';
import 'package:riddles_game_ru/core/service/ads/i_ad_manager.dart';

class AdManager extends IAdManager {
  RewardedAd? _rewardedAd;
  InterstitialAd? _interstitialAd;

  @override
  loadRewardedAd() async {
    await RewardedAd.load(
      adUnitId: AppConstant.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) async => _rewardedAd = ad,
        onAdFailedToLoad: (error) => _rewardedAd = null,
      ),
    );
  }

  @override
  showRewardedAd(BuildContext context) async {
    if (_rewardedAd == null) {
      loadRewardedAd();
    } else {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (RewardedAd ad) async {
          await ad.dispose();
          loadRewardedAd();
        },
        onAdFailedToShowFullScreenContent:
            (RewardedAd ad, AdError error) async {
          await ad.dispose();
          loadRewardedAd();
        },
      );
      await _rewardedAd!.setImmersiveMode(true);

      void onRewardedAdUserEarnedReward(
          AdWithoutView ad, RewardItem reward) async {
        final user = BlocProvider.of<UserBloc>(context).state.user;
        final userModel = UserModel(
          name: user.name,
          score: user.score + reward.amount.toInt(),
        );
        BlocProvider.of<UserBloc>(context).add(UserAdd(user: userModel));
      }

      await _rewardedAd!.show(
        onUserEarnedReward: (f, s) => onRewardedAdUserEarnedReward(f, s),
      );
    }
  }

  @override
  loadInterstitialAd() async {
    await InterstitialAd.load(
      adUnitId: AppConstant.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (interstitialAd) {
          _interstitialAd = interstitialAd;
        },
        onAdFailedToLoad: (_) => {},
      ),
    );
  }

  @override
  showInterstitialAd() async {
    if (_interstitialAd == null) {
      loadInterstitialAd();
    } else {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) async {
          await ad.dispose();
          loadInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) async {
          await ad.dispose();
          loadInterstitialAd();
        },
      );
      await _interstitialAd!.show();
    }
  }

  void disposeAds() {
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
  }
}
