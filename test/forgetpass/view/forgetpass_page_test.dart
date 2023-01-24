// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/forgetpass/forgetpass.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ForgetpassPage', () {
    group('route', () {
      test('is routable', () {
        expect(ForgetpassPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ForgetpassView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ForgetpassPage()));
      expect(find.byType(ForgetpassView), findsOneWidget);
    });
  });
}
