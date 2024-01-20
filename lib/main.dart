import 'dart:async';
import 'dart:developer';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/bloc/theme_locale_bloc.dart';
import 'core/themes/custom_theme.dart';
import 'features/auth/presentation/forgot_password/bloc/auth_bloc.dart';
import 'features/auth/presentation/forgot_password/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/di/injection.dart';
import 'core/bloc/app_bloc_observer.dart';
import 'core/config/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  await registerDependncies();
  bootstrap(() => const MainApp());
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  ErrorWidget.builder = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
    return Scaffold(
        body: Center(
      child: Text(
        details.exceptionAsString(),
        style: const TextStyle(color: Colors.red),
      ),
    ));
  };

  Bloc.observer = AppBlocObserver();
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(await builder());
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(create: (context) => LanguageCubit()),
          BlocProvider(create: (context) => AuthBloc()),
        ],
        child: BlocBuilder<LanguageCubit, Locale>(
          builder: (context, locale) {
            return BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) {
                return MaterialApp(
                  title: AppConstants.appName,
                  theme: CustomTheme.lightTheme,
                  darkTheme: CustomTheme.darkTheme,
                  localizationsDelegates: const [
                    AppLocalizations.delegate, // Add this line
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en'),
                  ],
                  locale: locale,
                  themeMode: themeMode,
                  debugShowCheckedModeBanner: false,
                  home: const AuthScreen(),
                );
              },
            );
          },
        ));
  }
}
