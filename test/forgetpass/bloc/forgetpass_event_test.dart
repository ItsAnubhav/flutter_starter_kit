// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/presentation/forgetpass/bloc/bloc.dart';

void main() {
  group('ForgetpassEvent', () {  
    group('CustomForgetpassEvent', () {
      test('supports value equality', () {
        expect(
          const CustomForgetpassEvent(),
          isNotNull
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CustomForgetpassEvent(),
          equals(const CustomForgetpassEvent()),
        );
      });
    });
  });
}
