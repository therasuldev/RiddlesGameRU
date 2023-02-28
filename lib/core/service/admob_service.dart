import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:riddles_game_ru/core/const/constant.dart';
import 'package:riddles_game_ru/core/model/user/user.dart';
import 'package:riddles_game_ru/core/provider/bloc/user/user_bloc.dart';
class AdManager {
  // BannerAd? _bannerAd;
  // InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;

  // void loadBannerAd() {
  //   _bannerAd = BannerAd(
  //     adUnitId: Platform.isIOS
  //         ? "ca-app-pub-3940256099942544/2934735716"
  //         : AppConstant.rewardedAdUnitId,
  //     size: AdSize.banner,
  //     request: const AdRequest(),
  //     listener: const BannerAdListener(),
  //   );

  //   _bannerAd?.load();
  // }

  void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: AppConstant.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => _rewardedAd = ad,
        onAdFailedToLoad: (error) => _rewardedAd = null,
      ),
    );
  }

  // void loadInterstitialAd() {
  //   String interstitialAdId = Platform.isIOS
  //       ? "ca-app-pub-3940256099942544/4411468910"
  //       : AppConstant.rewardedAdUnitId;

  //   InterstitialAd.load(
  //       adUnitId: interstitialAdId,
  //       request: const AdRequest(),
  //       adLoadCallback: InterstitialAdLoadCallback(
  //         onAdLoaded: (InterstitialAd ad) {
  //           // Keep a reference to the ad so you can show it later.
  //           _interstitialAd = ad;

  //           ad.fullScreenContentCallback = FullScreenContentCallback(
  //             onAdDismissedFullScreenContent: (InterstitialAd ad) {
  //               ad.dispose();
  //               loadInterstitialAd();
  //             },
  //             onAdFailedToShowFullScreenContent:
  //                 (InterstitialAd ad, AdError error) {
  //               ad.dispose();
  //               loadInterstitialAd();
  //             },
  //           );
  //         },
  //         onAdFailedToLoad: (LoadAdError error) {
  //           print('InterstitialAd failed to load: $error');
  //         },
  //       ));
  // }

  // void showInterstitial() {
  //   _interstitialAd?.show();
  // }

  // BannerAd? getBannerAd() {
  //   return _bannerAd;
  // }

  Future showRewardedAd(BuildContext context) async {
    final user = context.read<UserBloc>().state.user;
    if (_rewardedAd != null) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdShowedFullScreenContent: (RewardedAd ad) {},
          onAdDismissedFullScreenContent: (RewardedAd ad) async {
            await ad.dispose();
            loadRewardedAd();
          },
          onAdFailedToShowFullScreenContent:
              (RewardedAd ad, AdError error) async {
            await ad.dispose();
            loadRewardedAd();
          });

      await _rewardedAd!.setImmersiveMode(true);
      await _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          context.read<UserBloc>().add(
                UserAdd(
                    user: UserModel(
                        name: user.name,
                        score: (user.score + reward.amount.toInt()))),
              );
        },
      );
    }
  }

  void disposeAds() {
    // _bannerAd?.dispose();
    // _interstitialAd?.dispose();
    _rewardedAd?.dispose();
  }
}
