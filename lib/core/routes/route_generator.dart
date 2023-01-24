import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/forgetpass/forgetpass.dart';
import 'package:flutter_starter/presentation/login/login.dart';
import 'package:flutter_starter/presentation/otpverification/otpverification.dart';
import 'package:flutter_starter/presentation/resetpass/resetpass.dart';
import 'package:flutter_starter/presentation/signup/signup.dart';
import 'package:flutter_starter/presentation/splash/splash.dart';
import 'package:flutter_starter/core/routes/routes.dart' as route;

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    if (kDebugMode) {
      print("PUSHED ${settings.name} WITH ARGS: ${settings.arguments}");
    }
    switch (settings.name) {
      case route.splash:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case route.login:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case route.signup:
        return MaterialPageRoute(builder: (ctx) => const SignupPage());
      case route.forgetPass:
        return MaterialPageRoute(builder: (ctx) => const ForgetpassPage());
      case route.otpVerification:
        return MaterialPageRoute(builder: (ctx) => const OtpVerificationPage());
      case route.resetPass:
        return MaterialPageRoute(builder: (ctx) => const ResetpassPage());
      default:
        return _errorRoute(settings.name);
    }
  }

  static Route<dynamic> _errorRoute(String? name) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Text('Unknown route: $name'),
        ),
      );
    });
  }
}
