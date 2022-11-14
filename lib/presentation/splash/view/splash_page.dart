import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/splash/bloc/bloc.dart';
import 'package:flutter_starter/presentation/splash/widgets/splash_body.dart';

class SplashPage extends StatelessWidget {
  /// {@macro splash_page}
  const SplashPage({super.key});

  static const pageName = "SplashPage";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: const Scaffold(
        body: SplashView(),
      ),
    );
  }
}

/// {@template splash_view}
/// Displays the Body of SplashView
/// {@endtemplate}
class SplashView extends StatelessWidget {
  /// {@macro splash_view}
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashBody();
  }
}
