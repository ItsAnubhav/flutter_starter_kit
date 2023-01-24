// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/presentation/otpverification/bloc/bloc.dart';

void main() {
  group('OtpverificationEvent', () {  
    group('CustomOtpverificationEvent', () {
      test('supports value equality', () {
        expect(
          const CustomOtpverificationEvent(),
          isNotNull
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CustomOtpverificationEvent(),
          equals(const CustomOtpverificationEvent()),
        );
      });
    });
  });
}
