import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashInitial()) {
    on<CustomSplashEvent>(_onCustomSplashEvent);
  }

  FutureOr<void> _onCustomSplashEvent(
    CustomSplashEvent event,
    Emitter<SplashState> emit,
  ) {
    // TODO: Add Logic
  }
}
