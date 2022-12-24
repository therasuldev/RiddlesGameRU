part of "app_cubit.dart";

class AppState {
  final String? themeName;
  final ThemeData? theme;
  final String? langCode;

  AppState({this.themeName, this.theme, this.langCode});

  AppState copyWith({
    String? themeName,
    ThemeData? theme,
    String? langCode,
  }) {
    return AppState(
      themeName: themeName ?? this.themeName,
      theme: theme ?? this.theme,
      langCode: langCode ?? this.langCode,
    );
  }

  static get empty => AppState();
}
