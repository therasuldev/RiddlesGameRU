import 'package:flutter/material.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import 'package:riddles_game_ru/view/widgets/widgets.dart';

class LoadingWidget extends R2StatelessWidget {
  LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ActivityIndicatorDemoRow(
      const NutsActivityIndicator(radius: 12),
    );
  }
}

class ActivityIndicatorDemoRow extends R2StatelessWidget {
  ActivityIndicatorDemoRow(
    this.indicator, {
    Key? key,
  }) : super(key: key);

  final NutsActivityIndicator indicator;

  @override
  Widget build(BuildContext context) {
    return indicator;
  }
}
