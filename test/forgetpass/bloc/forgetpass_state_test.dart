// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/presentation/forgetpass/bloc/bloc.dart';

void main() {
  group('ForgetpassState', () {
    test('supports value equality', () {
      expect(
        ForgetpassState(),
        equals(
          const ForgetpassState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const ForgetpassState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const forgetpassState = ForgetpassState(
            customProperty: 'My property',
          );
          expect(
            forgetpassState.copyWith(),
            equals(forgetpassState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const forgetpassState = ForgetpassState(
            customProperty: 'My property',
          );
          final otherForgetpassState = ForgetpassState(
            customProperty: 'My property 2',
          );
          expect(forgetpassState, isNot(equals(otherForgetpassState)));

          expect(
            forgetpassState.copyWith(
              customProperty: otherForgetpassState.customProperty,
            ),
            equals(otherForgetpassState),
          );
        },
      );
    });
  });
}
