part of 'login_bloc.dart';

abstract class LoginEvent  extends Equatable {
  const LoginEvent();
}

class CustomLoginEvent extends LoginEvent {

  const CustomLoginEvent();

  @override
  List<Object> get props => [];
}

class OnRegisterClicked extends LoginEvent{
  BuildContext context;
  OnRegisterClicked(this.context);

  @override
  List<Object?> get props => [];
}
