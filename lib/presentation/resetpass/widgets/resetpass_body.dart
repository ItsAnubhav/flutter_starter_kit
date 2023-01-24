import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/resetpass/bloc/bloc.dart';

/// {@template resetpass_body}
/// Body of the ResetpassPage.
///
/// Add what it does
/// {@endtemplate}
class ResetpassBody extends StatelessWidget {
  /// {@macro resetpass_body}
  const ResetpassBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetpassBloc, ResetpassState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
