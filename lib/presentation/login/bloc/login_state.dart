part of 'login_bloc.dart';


abstract class LoginState extends Equatable {
  const LoginState();

}

class LoginInitial extends LoginState {
  const LoginInitial() : super();

  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  final int progress;
  const LoginLoading({required this.progress}) : super();

  @override
  List<Object?> get props => [progress];
}

class LoginSuccess extends LoginState{
  const LoginSuccess() : super();

  @override
  List<Object?> get props => [];
}

class LoginFailed extends LoginState{
  final String message;
  const LoginFailed({required this.message}) : super();

  @override
  List<Object?> get props => [];
}