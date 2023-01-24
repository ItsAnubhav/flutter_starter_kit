import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/forgetpass/bloc/bloc.dart';
import 'package:flutter_starter/presentation/forgetpass/widgets/forgetpass_body.dart';

/// {@template forgetpass_page}
/// A description for ForgetpassPage
/// {@endtemplate}
class ForgetpassPage extends StatelessWidget {
  /// {@macro forgetpass_page}
  const ForgetpassPage({super.key});

  /// The static route for ForgetpassPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ForgetpassPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetpassBloc(),
      child: const Scaffold(
        body: ForgetpassView(),
      ),
    );
  }    
}

/// {@template forgetpass_view}
/// Displays the Body of ForgetpassView
/// {@endtemplate}
class ForgetpassView extends StatelessWidget {
  /// {@macro forgetpass_view}
  const ForgetpassView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ForgetpassBody();
  }
}
