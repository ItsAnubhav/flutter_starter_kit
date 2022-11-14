// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/splash/splash.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SplashBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => SplashBloc(),
          child: MaterialApp(home: SplashBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
