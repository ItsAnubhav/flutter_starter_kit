import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/core/routes/route_generator.dart';
import 'package:flutter_starter/core/themes/custom_theme.dart';
import 'package:flutter_starter/presentation/splash/splash.dart';
import 'presentation/app/app_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: CustomTheme.lightTheme,
        onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        initialRoute: SplashPage.pageName);
  }
}
