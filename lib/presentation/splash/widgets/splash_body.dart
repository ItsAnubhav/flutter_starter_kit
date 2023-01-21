import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/splash/bloc/bloc.dart';

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
