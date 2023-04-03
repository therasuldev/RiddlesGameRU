import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:riddles_game_ru/core/constant/constant.dart';
import 'package:riddles_game_ru/core/service/ads/i_ad_manager.dart';

class AdManager extends IAdManager {
  InterstitialAd? _interstitialAd;

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
  }
}
