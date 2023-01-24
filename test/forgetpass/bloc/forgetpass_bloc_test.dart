// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/presentation/forgetpass/bloc/bloc.dart';

void main() {
  group('ForgetpassBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ForgetpassBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final forgetpassBloc = ForgetpassBloc();
      expect(forgetpassBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<ForgetpassBloc, ForgetpassState>(
      'CustomForgetpassEvent emits nothing',
      build: ForgetpassBloc.new,
      act: (bloc) => bloc.add(const CustomForgetpassEvent()),
      expect: () => <ForgetpassState>[],
    );
  });
}
