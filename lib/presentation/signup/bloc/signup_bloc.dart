import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(const SignupInitial()) {
    on<CustomSignupEvent>(_onCustomSignupEvent);
  }

  FutureOr<void> _onCustomSignupEvent(
    CustomSignupEvent event,
    Emitter<SignupState> emit,
  ) {
    // TODO: Add Logic
  }
}
