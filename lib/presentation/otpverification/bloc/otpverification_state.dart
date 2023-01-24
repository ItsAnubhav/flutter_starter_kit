part of 'otpverification_bloc.dart';

/// {@template otpverification_state}
/// OtpverificationState description
/// {@endtemplate}
class OtpverificationState extends Equatable {
  /// {@macro otpverification_state}
  const OtpverificationState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current OtpverificationState with property changes
  OtpverificationState copyWith({
    String? customProperty,
  }) {
    return OtpverificationState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template otpverification_initial}
/// The initial state of OtpverificationState
/// {@endtemplate}
class OtpverificationInitial extends OtpverificationState {
  /// {@macro otpverification_initial}
  const OtpverificationInitial() : super();
}
