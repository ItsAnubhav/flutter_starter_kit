// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/otpverification/otpverification.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OtpverificationBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => OtpverificationBloc(),
          child: MaterialApp(home: OtpverificationBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
