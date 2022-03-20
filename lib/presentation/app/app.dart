import 'package:base_flutter/commons/enums/app_theme.dart';
import 'package:base_flutter/presentation/app/styles/themes/dark/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:base_flutter/commons/utils/utils.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'global_state/theme_cubit/theme_cubit.dart';
import 'route/app_route.dart';
import 'global_state/global_listener.dart';
import 'global_state/global_providers.dart';
import 'styles/themes/default/export.dart';

class Application extends StatelessWidget {
  final String title;
  final String locale;

  const Application({Key? key, required this.title, required this.locale})
      : super(key: key);

  static final _navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState get navigator => _navigatorKey.currentState!;

  static BuildContext get globalContext => navigator.overlay!.context;

  Widget _builder(BuildContext context, Widget? child) {
    return MultiBlocListener(
      listeners: globalListeners,
      child: MediaQuery(
        ///Setting font does not change with system font size
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: globalProviders,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => Utils.unFocusField(context),
            child: MaterialApp(
              navigatorKey: _navigatorKey,
              title: title,
              theme: state.appTheme == AppTheme.dark
                  ? AppDarkThemes.getTheme()
                  : AppLightThemes.getTheme(),
              builder: (context, widget) => _builder(context, widget),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: Locale(locale),
              supportedLocales: S.delegate.supportedLocales,
              initialRoute: AppRoute.initial,
              onGenerateRoute: AppRoute.materialPageRoute,
            ),
          );
        },
      ),
    );
  }
}
