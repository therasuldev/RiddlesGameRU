import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int score;

  UserModel({required this.name, required this.score});

  static UserModel empty = UserModel(name: '', score: 0);
}
