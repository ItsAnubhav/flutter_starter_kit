// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/resetpass/resetpass.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ResetpassBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ResetpassBloc(),
          child: MaterialApp(home: ResetpassBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
