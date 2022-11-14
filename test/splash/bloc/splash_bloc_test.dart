// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_starter/presentation/splash/bloc/bloc.dart';

void main() {
  group('SplashBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          SplashBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final splashBloc = SplashBloc();
      expect(splashBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<SplashBloc, SplashState>(
      'CustomSplashEvent emits nothing',
      build: SplashBloc.new,
      act: (bloc) => bloc.add(const CustomSplashEvent()),
      expect: () => <SplashState>[],
    );
  });
}
