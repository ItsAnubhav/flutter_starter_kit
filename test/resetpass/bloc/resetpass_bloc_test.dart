// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/presentation/resetpass/bloc/bloc.dart';

void main() {
  group('ResetpassBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ResetpassBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final resetpassBloc = ResetpassBloc();
      expect(resetpassBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<ResetpassBloc, ResetpassState>(
      'CustomResetpassEvent emits nothing',
      build: ResetpassBloc.new,
      act: (bloc) => bloc.add(const CustomResetpassEvent()),
      expect: () => <ResetpassState>[],
    );
  });
}
