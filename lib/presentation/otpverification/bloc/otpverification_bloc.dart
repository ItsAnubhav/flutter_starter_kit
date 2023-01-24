import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'otpverification_event.dart';
part 'otpverification_state.dart';

class OtpverificationBloc extends Bloc<OtpverificationEvent, OtpverificationState> {
  OtpverificationBloc() : super(const OtpverificationInitial()) {
    on<CustomOtpverificationEvent>(_onCustomOtpverificationEvent);
  }

  FutureOr<void> _onCustomOtpverificationEvent(
    CustomOtpverificationEvent event,
    Emitter<OtpverificationState> emit,
  ) {
    // TODO: Add Logic
  }
}
