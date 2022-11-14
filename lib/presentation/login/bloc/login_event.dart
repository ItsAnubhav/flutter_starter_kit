part of 'login_bloc.dart';

abstract class LoginEvent  extends Equatable {
  const LoginEvent();
}

/// {@template custom_login_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomLoginEvent extends LoginEvent {
  /// {@macro custom_login_event}
  const CustomLoginEvent();


  @override
  List<Object> get props => [];

}
