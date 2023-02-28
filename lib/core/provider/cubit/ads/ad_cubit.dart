import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riddles_game_ru/core/service/admob_service.dart';

part 'ad_state.dart';

class AdCubit extends Cubit<AdState> {
  AdCubit({required AdManager adManager})
      : _adManager = adManager,
        super(AdState());

  final AdManager _adManager;

  void loadAd() {
    try {
      emit(AdLoad());
      _adManager.loadRewardedAd();
      emit(AdSucceed());
    } catch (_) {
      emit(AdFailed());
    }
  }

  void showAd(BuildContext context) async {
    try {
      emit(AdLoad());
      await _adManager.showRewardedAd(context);
      emit(AdSucceed());
    } catch (_) {
      emit(AdFailed());
    }
  }
}
