import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/logger.dart';

@immutable
class R2BlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    Log.d(
      'Prev ${change.currentState}\r\n'
      'Next ${change.nextState}',
    );
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    Log.d('[ onEvent $event ]');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    Log.d(
      'Prev State: ${transition.currentState}\r\n'
      'Next State: ${transition.nextState}',
    );
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Log.e(bloc, error, stackTrace);
  }
}
