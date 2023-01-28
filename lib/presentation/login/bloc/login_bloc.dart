import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/login/bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitial()) {
    on<OnLoginClicked>(_onLoginClicked);
  }

  FutureOr<void> _onLoginClicked(OnLoginClicked event, Emitter<LoginState> emit,) async {
    int i = 0;
    emit(LoginLoading(progress: i));
    await Future.delayed(Duration(seconds: 2));
    emit(LoginLoading(progress: 12));
    await Future.delayed(Duration(seconds: 2));
    emit(LoginLoading(progress: 26));
    await Future.delayed(Duration(seconds: 2));
    emit(LoginLoading(progress: 57));
    await Future.delayed(Duration(seconds: 2));
    emit(LoginLoading(progress: 100));
    emit(LoginSuccess());
  }
}
