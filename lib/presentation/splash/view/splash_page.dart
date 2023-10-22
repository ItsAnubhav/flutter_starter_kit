import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/presentation/splash/bloc/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  /// {@macro splash_page}
  const SplashPage({super.key});

  static const pageName = "SplashPage";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: const SplashBody(),
    );
  }
}

/// {@template splash_view}
/// Displays the Body of SplashView
/// {@endtemplate}
class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        SplashBloc().add(NavigateToMainEvent(context));
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
        );
      },
    );
  }
}
