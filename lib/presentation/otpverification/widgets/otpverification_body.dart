import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/otpverification/bloc/bloc.dart';

/// {@template otpverification_body}
/// Body of the OtpverificationPage.
///
/// Add what it does
/// {@endtemplate}
class OtpverificationBody extends StatelessWidget {
  /// {@macro otpverification_body}
  const OtpverificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpverificationBloc, OtpverificationState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
