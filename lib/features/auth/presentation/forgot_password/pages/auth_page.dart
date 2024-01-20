import '../../../../../core/extensions/neumorphism.dart';
import '/features/auth/presentation/forgot_password/bloc/auth_bloc.dart';
import '/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const ResponsiveLayout(
          mobile: AuthBody(), tablet: AuthBody(), desktop: AuthBody()),
    );
  }
}

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(4),
              ),
            ).addNeumorphism(
                topShadowColor: Colors.white.withOpacity(0.5),
                bottomShadowColor: Colors.white.withOpacity(0.5),
                borderRadius: 4),
          ],
        ));
  }
}
