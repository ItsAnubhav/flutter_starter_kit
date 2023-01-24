import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/resetpass/bloc/bloc.dart';
import 'package:flutter_starter/presentation/resetpass/widgets/resetpass_body.dart';

/// {@template resetpass_page}
/// A description for ResetpassPage
/// {@endtemplate}
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
        body: ResetpassView(),
      ),
    );
  }    
}

/// {@template resetpass_view}
/// Displays the Body of ResetpassView
/// {@endtemplate}
class ResetpassView extends StatelessWidget {
  /// {@macro resetpass_view}
  const ResetpassView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResetpassBody();
  }
}
