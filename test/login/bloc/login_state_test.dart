// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/presentation/login/bloc/bloc.dart';

void main() {
  group('LoginState', () {
    test('supports value equality', () {
      expect(
        LoginState(),
        equals(
          const LoginState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const LoginState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const loginState = LoginState(
            customProperty: 'My property',
          );
          expect(
            loginState.copyWith(),
            equals(loginState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const loginState = LoginState(
            customProperty: 'My property',
          );
          final otherLoginState = LoginState(
            customProperty: 'My property 2',
          );
          expect(loginState, isNot(equals(otherLoginState)));

          expect(
            loginState.copyWith(
              customProperty: otherLoginState.customProperty,
            ),
            equals(otherLoginState),
          );
        },
      );
    });
  });
}
