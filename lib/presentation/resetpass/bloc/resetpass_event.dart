part of 'resetpass_bloc.dart';

abstract class ResetpassEvent  extends Equatable {
  const ResetpassEvent();
}

/// {@template custom_resetpass_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomResetpassEvent extends ResetpassEvent {
  /// {@macro custom_resetpass_event}
  const CustomResetpassEvent();


  @override
  List<Object> get props => [];

}
