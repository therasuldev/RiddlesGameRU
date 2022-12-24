import 'package:flutter/material.dart';

import '../service/service.dart';
import '../utils/logger.dart';
import 'intl.dart';

class Riddle {
  static final Riddle _singleton = Riddle._internal();

  final Map<String, dynamic> instances = {};

  factory Riddle() => _singleton;

  Riddle._internal() {
    Log.v('${runtimeType.toString()} instance created');
  }

  set intl(Intl intl) => instances['intl'] = intl;
  Intl get intl => instances['intl'];

  set cacheService(CacheService service) => instances['cacheService'] = service;
  CacheService get cacheService => instances['cacheService'];

  String fmt(BuildContext context, String key, [List? args]) {
    return intl.of(context)?.fmt(key, args) ?? '';
  }
}

@immutable
abstract class RiddleAppModel {
  const RiddleAppModel();

  const RiddleAppModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}

typedef ItemCreator<S> = S Function();
