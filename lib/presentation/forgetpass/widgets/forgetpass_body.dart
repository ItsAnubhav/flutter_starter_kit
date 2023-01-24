import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/forgetpass/bloc/bloc.dart';

/// {@template forgetpass_body}
/// Body of the ForgetpassPage.
///
/// Add what it does
/// {@endtemplate}
class ForgetpassBody extends StatelessWidget {
  /// {@macro forgetpass_body}
  const ForgetpassBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetpassBloc, ForgetpassState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
