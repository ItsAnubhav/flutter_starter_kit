part of 'splash_bloc.dart';

abstract class SplashEvent  extends Equatable {
  const SplashEvent();
}

class NavigateToMainEvent extends SplashEvent {
  final BuildContext context;
  const NavigateToMainEvent(this.context);



  @override
  List<Object> get props => [];

}
