import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'resetpass_event.dart';
part 'resetpass_state.dart';

class ResetpassBloc extends Bloc<ResetpassEvent, ResetpassState> {
  ResetpassBloc() : super(const ResetpassInitial()) {
    on<CustomResetpassEvent>(_onCustomResetpassEvent);
  }

  FutureOr<void> _onCustomResetpassEvent(
    CustomResetpassEvent event,
    Emitter<ResetpassState> emit,
  ) {
    // TODO: Add Logic
  }
}
