part of 'splash_bloc.dart';

abstract class SplashEvent  extends Equatable {
  const SplashEvent();
}

/// {@template custom_splash_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomSplashEvent extends SplashEvent {
  /// {@macro custom_splash_event}
  const CustomSplashEvent();


  @override
  List<Object> get props => [];

}
