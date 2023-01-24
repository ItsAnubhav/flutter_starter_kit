part of 'forgetpass_bloc.dart';

/// {@template forgetpass_state}
/// ForgetpassState description
/// {@endtemplate}
class ForgetpassState extends Equatable {
  /// {@macro forgetpass_state}
  const ForgetpassState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ForgetpassState with property changes
  ForgetpassState copyWith({
    String? customProperty,
  }) {
    return ForgetpassState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template forgetpass_initial}
/// The initial state of ForgetpassState
/// {@endtemplate}
class ForgetpassInitial extends ForgetpassState {
  /// {@macro forgetpass_initial}
  const ForgetpassInitial() : super();
}
