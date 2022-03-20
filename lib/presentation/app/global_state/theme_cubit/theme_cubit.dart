import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:base_flutter/commons/enums/app_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(appTheme: AppTheme.light));

  void themeChanged(AppTheme appTheme) {
    final currentState = state;

    emit(currentState.copyWith(appTheme: appTheme));
  }
}
