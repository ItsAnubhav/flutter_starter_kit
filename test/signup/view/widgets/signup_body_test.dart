// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/signup/signup.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SignupBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => SignupBloc(),
          child: MaterialApp(home: SignupBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
