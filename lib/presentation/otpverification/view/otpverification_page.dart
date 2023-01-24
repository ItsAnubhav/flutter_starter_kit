import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/otpverification/bloc/bloc.dart';
import 'package:flutter_starter/presentation/otpverification/widgets/otpverification_body.dart';


class OtpVerificationPage extends StatelessWidget {

  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpverificationBloc(),
      child: const Scaffold(
        body: OtpVerificationView(),
      ),
    );
  }    
}


class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const OtpverificationBody();
  }
}
