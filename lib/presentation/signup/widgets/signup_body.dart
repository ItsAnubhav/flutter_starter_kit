import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/signup/bloc/bloc.dart';

/// {@template signup_body}
/// Body of the SignupPage.
///
/// Add what it does
/// {@endtemplate}
class SignupBody extends StatelessWidget {
  /// {@macro signup_body}
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
