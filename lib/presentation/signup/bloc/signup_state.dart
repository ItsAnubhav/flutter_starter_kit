part of 'signup_bloc.dart';

/// {@template signup_state}
/// SignupState description
/// {@endtemplate}
class SignupState extends Equatable {
  /// {@macro signup_state}
  const SignupState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current SignupState with property changes
  SignupState copyWith({
    String? customProperty,
  }) {
    return SignupState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template signup_initial}
/// The initial state of SignupState
/// {@endtemplate}
class SignupInitial extends SignupState {
  /// {@macro signup_initial}
  const SignupInitial() : super();
}
