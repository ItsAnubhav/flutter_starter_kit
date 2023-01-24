part of 'resetpass_bloc.dart';

/// {@template resetpass_state}
/// ResetpassState description
/// {@endtemplate}
class ResetpassState extends Equatable {
  /// {@macro resetpass_state}
  const ResetpassState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current ResetpassState with property changes
  ResetpassState copyWith({
    String? customProperty,
  }) {
    return ResetpassState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template resetpass_initial}
/// The initial state of ResetpassState
/// {@endtemplate}
class ResetpassInitial extends ResetpassState {
  /// {@macro resetpass_initial}
  const ResetpassInitial() : super();
}
