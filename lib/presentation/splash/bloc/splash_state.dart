part of 'splash_bloc.dart';

/// {@template splash_state}
/// SplashState description
/// {@endtemplate}
class SplashState extends Equatable {
  /// {@macro splash_state}
  const SplashState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current SplashState with property changes
  SplashState copyWith({
    String? customProperty,
  }) {
    return SplashState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template splash_initial}
/// The initial state of SplashState
/// {@endtemplate}
class SplashInitial extends SplashState {
  /// {@macro splash_initial}
  const SplashInitial() : super();
}
