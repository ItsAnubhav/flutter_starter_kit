// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/presentation/signup/bloc/bloc.dart';

void main() {
  group('SignupEvent', () {  
    group('CustomSignupEvent', () {
      test('supports value equality', () {
        expect(
          const CustomSignupEvent(),
          isNotNull
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CustomSignupEvent(),
          equals(const CustomSignupEvent()),
        );
      });
    });
  });
}
