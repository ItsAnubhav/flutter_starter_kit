// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/presentation/otpverification/bloc/bloc.dart';

void main() {
  group('OtpverificationBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          OtpverificationBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final otpverificationBloc = OtpverificationBloc();
      expect(otpverificationBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<OtpverificationBloc, OtpverificationState>(
      'CustomOtpverificationEvent emits nothing',
      build: OtpverificationBloc.new,
      act: (bloc) => bloc.add(const CustomOtpverificationEvent()),
      expect: () => <OtpverificationState>[],
    );
  });
}
