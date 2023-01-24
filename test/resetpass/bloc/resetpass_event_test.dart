// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/presentation/resetpass/bloc/bloc.dart';

void main() {
  group('ResetpassEvent', () {  
    group('CustomResetpassEvent', () {
      test('supports value equality', () {
        expect(
          const CustomResetpassEvent(),
          isNotNull
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CustomResetpassEvent(),
          equals(const CustomResetpassEvent()),
        );
      });
    });
  });
}
