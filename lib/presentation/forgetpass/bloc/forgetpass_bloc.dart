import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'forgetpass_event.dart';
part 'forgetpass_state.dart';

class ForgetpassBloc extends Bloc<ForgetpassEvent, ForgetpassState> {
  ForgetpassBloc() : super(const ForgetpassInitial()) {
    on<CustomForgetpassEvent>(_onCustomForgetpassEvent);
  }

  FutureOr<void> _onCustomForgetpassEvent(
    CustomForgetpassEvent event,
    Emitter<ForgetpassState> emit,
  ) {
    // TODO: Add Logic
  }
}
