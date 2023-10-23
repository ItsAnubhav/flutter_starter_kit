import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/presentation/resetpass/bloc/resetpass_bloc.dart';

class ResetpassPage extends StatelessWidget {
  /// {@macro resetpass_page}
  const ResetpassPage({super.key});

  /// The static route for ResetpassPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ResetpassPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetpassBloc(),
      child: const Scaffold(
        body: ResetpassBody(),
      ),
    );
  }
}

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
