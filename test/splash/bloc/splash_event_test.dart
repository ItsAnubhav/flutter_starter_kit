// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/presentation/splash/bloc/bloc.dart';

void main() {
  group('SplashEvent', () {  
    group('CustomSplashEvent', () {
      test('supports value equality', () {
        expect(
          const CustomSplashEvent(),
          isNotNull
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CustomSplashEvent(),
          equals(const CustomSplashEvent()),
        );
      });
    });
  });
}
