import 'dart:io';

//import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobService {
  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-9923000364759810/5762212236';
    }
    return null;
  }

  static String? get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-9923000364759810/1248252152';
    }
    return null;
  }

  // static final BannerAdListener bannerAdListener = BannerAdListener(
  //   onAdLoaded: (ad) => debugPrint('Ad loaded'),
  //   onAdFailedToLoad: (ad, error) {
  //     ad.dispose();
  //     debugPrint('Ad failed to load: $error');
  //   },
  //   onAdOpened: (ad) => debugPrint('Ad Opened'),
  //   onAdClosed: (ad) => debugPrint('Ad Closed'),
  // );
}
