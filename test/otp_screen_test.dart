
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
  testWidgets('', (WidgetTester tester) async {

    OtpScreen screen = OtpScreen();
    await tester.pumpWidget(makeTestableWidget(screen));
    await tester.tap(find.byKey(const Key('number1')));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);


  });
}