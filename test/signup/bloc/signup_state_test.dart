// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/presentation/signup/bloc/bloc.dart';

void main() {
  group('SignupState', () {
    test('supports value equality', () {
      expect(
        SignupState(),
        equals(
          const SignupState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const SignupState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const signupState = SignupState(
            customProperty: 'My property',
          );
          expect(
            signupState.copyWith(),
            equals(signupState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const signupState = SignupState(
            customProperty: 'My property',
          );
          final otherSignupState = SignupState(
            customProperty: 'My property 2',
          );
          expect(signupState, isNot(equals(otherSignupState)));

          expect(
            signupState.copyWith(
              customProperty: otherSignupState.customProperty,
            ),
            equals(otherSignupState),
          );
        },
      );
    });
  });
}
