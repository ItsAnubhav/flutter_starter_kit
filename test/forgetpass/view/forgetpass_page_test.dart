// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_starter/presentation/forgetpass/forgetpass.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ForgetPassPage', () {

    testWidgets('renders ForgetPassView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ForgetPassPage()));
      expect(find.byType(ForgetPassView), findsOneWidget);
    });
  });
}
