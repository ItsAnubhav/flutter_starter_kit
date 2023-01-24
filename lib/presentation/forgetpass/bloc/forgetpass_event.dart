part of 'forgetpass_bloc.dart';

abstract class ForgetpassEvent  extends Equatable {
  const ForgetpassEvent();
}

/// {@template custom_forgetpass_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomForgetpassEvent extends ForgetpassEvent {
  /// {@macro custom_forgetpass_event}
  const CustomForgetpassEvent();


  @override
  List<Object> get props => [];

}
