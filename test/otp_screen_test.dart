
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pin_screen/main.dart';
import 'package:pin_screen/screens/otp_screen.dart';

void main() {

  Widget makeTestableWidget(Widget child) {
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {

    OtpScreen screen = OtpScreen();
    await tester.pumpWidget(makeTestableWidget(screen));

  });
}