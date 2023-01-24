import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial()) {
    on<OnRegisterClicked>(_onRegisterBtnClicked);
  }

  FutureOr<void> _onRegisterBtnClicked(
    OnRegisterClicked event,
    Emitter<LoginState> emit,
  ) {

  }
}
