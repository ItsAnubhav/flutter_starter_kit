part of 'signup_bloc.dart';

abstract class SignupEvent  extends Equatable {
  const SignupEvent();
}

class CustomSignupEvent extends SignupEvent {

  const CustomSignupEvent();

  @override
  List<Object> get props => [];

}
