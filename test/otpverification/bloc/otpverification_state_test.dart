// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/presentation/otpverification/bloc/bloc.dart';

void main() {
  group('OtpverificationState', () {
    test('supports value equality', () {
      expect(
        OtpverificationState(),
        equals(
          const OtpverificationState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const OtpverificationState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const otpverificationState = OtpverificationState(
            customProperty: 'My property',
          );
          expect(
            otpverificationState.copyWith(),
            equals(otpverificationState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const otpverificationState = OtpverificationState(
            customProperty: 'My property',
          );
          final otherOtpverificationState = OtpverificationState(
            customProperty: 'My property 2',
          );
          expect(otpverificationState, isNot(equals(otherOtpverificationState)));

          expect(
            otpverificationState.copyWith(
              customProperty: otherOtpverificationState.customProperty,
            ),
            equals(otherOtpverificationState),
          );
        },
      );
    });
  });
}
