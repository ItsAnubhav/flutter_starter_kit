import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/splash/bloc/bloc.dart';

class SplashBody extends StatelessWidget {
  /// {@macro splash_body}
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
