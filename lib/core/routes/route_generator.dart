import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/splash/splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    if (kDebugMode) {
      print("PUSHED ${settings.name} WITH ARGS: ${settings.arguments}");
    }
    switch (settings.name) {
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
