part of 'user_bloc.dart';

class UserState extends Equatable {
  final bool isSuccess;
  final UserModel user;

  const UserState({
    required this.isSuccess,
    required this.user,
  });

  UserState copyWith({
    final bool? isSuccess,
    final UserModel? user,
  }) {
    return UserState(
      isSuccess: isSuccess ?? this.isSuccess,
      user: user ?? this.user,
    );
  }

  UserState.empty()
      : this(
          isSuccess: false,
          user: UserModel(name: '', score: 0),
        );

  @override
  List<Object?> get props => [user];
}
