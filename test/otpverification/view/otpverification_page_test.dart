// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/otpverification/otpverification.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OtpverificationPage', () {
    group('route', () {
      test('is routable', () {
        expect(OtpVerificationPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders OtpverificationView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: OtpVerificationPage()));
      expect(find.byType(OtpVerificationView), findsOneWidget);
    });
  });
}
