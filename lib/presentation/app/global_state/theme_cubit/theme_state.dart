part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final AppTheme appTheme;

  const ThemeState({
    required this.appTheme,
  });

  ThemeState copyWith({required AppTheme appTheme}) {
    return ThemeState(
        appTheme: appTheme
    );
  }

  @override
  List<Object?> get props => [appTheme];
}