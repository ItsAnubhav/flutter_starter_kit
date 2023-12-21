import 'dart:async';
import 'dart:developer';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/themes/custom_theme.dart';
import 'features/auth/presentation/forgot_password/bloc/auth_bloc.dart';
import 'features/auth/presentation/forgot_password/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/di/injection.dart';
import 'core/bloc_observer/app_bloc_observer.dart';
import 'core/config/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerDependncies();
  bootstrap(() => const MainApp());
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();
  await runZonedGuarded(
    () async => runApp(await builder()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        ],
        child: MaterialApp(
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
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: const AuthScreen(),
        ));
  }
}
