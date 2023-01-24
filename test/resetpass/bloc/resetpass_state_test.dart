// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/presentation/resetpass/bloc/bloc.dart';

void main() {
  group('ResetpassState', () {
    test('supports value equality', () {
      expect(
        ResetpassState(),
        equals(
          const ResetpassState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const ResetpassState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const resetpassState = ResetpassState(
            customProperty: 'My property',
          );
          expect(
            resetpassState.copyWith(),
            equals(resetpassState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const resetpassState = ResetpassState(
            customProperty: 'My property',
          );
          final otherResetpassState = ResetpassState(
            customProperty: 'My property 2',
          );
          expect(resetpassState, isNot(equals(otherResetpassState)));

          expect(
            resetpassState.copyWith(
              customProperty: otherResetpassState.customProperty,
            ),
            equals(otherResetpassState),
          );
        },
      );
    });
  });
}
