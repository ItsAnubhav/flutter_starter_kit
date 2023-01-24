// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/forgetpass/forgetpass.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ForgetpassBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ForgetpassBloc(),
          child: MaterialApp(home: ForgetpassBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
