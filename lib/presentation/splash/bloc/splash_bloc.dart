import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/core/routes/routes.dart';
import 'package:flutter_starter/presentation/login/login.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashInitial()) {
    on<NavigateToMainEvent>(_onCustomSplashEvent);
  }

  FutureOr<void> _onCustomSplashEvent(
    NavigateToMainEvent event,
    Emitter<SplashState> emit,
  ) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(event.context, Routes.login,(_)=>false);
    });
  }
}
