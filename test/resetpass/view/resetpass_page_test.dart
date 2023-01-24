// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/resetpass/resetpass.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ResetpassPage', () {
    group('route', () {
      test('is routable', () {
        expect(ResetpassPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ResetpassView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ResetpassPage()));
      expect(find.byType(ResetpassView), findsOneWidget);
    });
  });
}
