// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/presentation/signup/bloc/bloc.dart';

void main() {
  group('SignupBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          SignupBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final signupBloc = SignupBloc();
      expect(signupBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<SignupBloc, SignupState>(
      'CustomSignupEvent emits nothing',
      build: SignupBloc.new,
      act: (bloc) => bloc.add(const CustomSignupEvent()),
      expect: () => <SignupState>[],
    );
  });
}
