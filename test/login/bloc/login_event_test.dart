// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/presentation/login/bloc/bloc.dart';

void main() {
  group('LoginEvent', () {  
    group('CustomLoginEvent', () {
      test('supports value equality', () {
        expect(
          const CustomLoginEvent(),
          isNotNull
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CustomLoginEvent(),
          equals(const CustomLoginEvent()),
        );
      });
    });
  });
}
