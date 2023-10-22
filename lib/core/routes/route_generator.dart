import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/core/routes/routes.dart';
import 'package:flutter_starter/presentation/forgetpass/forgetpass.dart';
import 'package:flutter_starter/presentation/login/view/login_page.dart';
import 'package:flutter_starter/presentation/otpverification/view/otpverification_page.dart';
import 'package:flutter_starter/presentation/resetpass/resetpass.dart';
import 'package:flutter_starter/presentation/signup/signup.dart';
import 'package:flutter_starter/presentation/splash/view/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    if (kDebugMode) {
      print("PUSHED ${settings.name} WITH ARGS: ${settings.arguments}");
    }
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case Routes.signup:
        return MaterialPageRoute(builder: (ctx) => const SignupPage());
      case Routes.forgetPass:
        return MaterialPageRoute(builder: (ctx) => const ForgetPassPage());
      case Routes.otpVerification:
        final args = settings.arguments as Map<String, dynamic>;
        final phoneNo = args['phone_no'] as String;
        return MaterialPageRoute(
            builder: (ctx) => OtpVerificationPage(
                  phoneNo: phoneNo,
                ));
      case Routes.resetPass:
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
