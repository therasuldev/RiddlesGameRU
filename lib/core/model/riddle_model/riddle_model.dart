import 'package:hive_flutter/hive_flutter.dart';

part 'riddle_model.g.dart';

@HiveType(typeId: 0)
class RiddleModel {
  @HiveField(0)
  final String riddle;
  @HiveField(1)
  final String answer;

  RiddleModel({
    required this.riddle,
    required this.answer,
  });

  RiddleModel.fromJson(Map<String, dynamic> data)
      : riddle = data['riddle'],
        answer = data['answer'];
}
