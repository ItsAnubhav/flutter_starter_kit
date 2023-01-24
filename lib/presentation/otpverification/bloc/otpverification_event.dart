part of 'otpverification_bloc.dart';

abstract class OtpverificationEvent  extends Equatable {
  const OtpverificationEvent();
}

/// {@template custom_otpverification_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomOtpverificationEvent extends OtpverificationEvent {
  /// {@macro custom_otpverification_event}
  const CustomOtpverificationEvent();


  @override
  List<Object> get props => [];

}
