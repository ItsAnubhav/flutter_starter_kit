import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/forgetpass/bloc/bloc.dart';
import 'package:flutter_starter/presentation/forgetpass/widgets/forgetpass_body.dart';

class ForgetPassPage extends StatelessWidget {
  const ForgetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetpassBloc(),
      child: const Scaffold(
        body: ForgetPassView(),
      ),
    );
  }    
}

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ForgetPassBody();
  }
}
