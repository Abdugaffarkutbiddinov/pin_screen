
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pin_screen/screens/otp_screen.dart';

void main() {
  group('validate number', () {
    test('clearing  value returns empty substring of selected  value',() {
      var result = PinCodeValidator.validateFirstNumber("");
      expect(result, "");
    });

    test('passing first value returns substring of first value',() {
      var result = PinCodeValidator.validateFirstNumber("1");
      expect(result, "1");
    });

    test('passing second value returns substring of second value',() {
      var result = PinCodeValidator.validateSecondNumber("12");
      expect(result, "2");
    });

    test('passing third value returns substring of third value',() {
      var result = PinCodeValidator.validateThirdNumber("123");
      expect(result, "3");
    });

    test('passing fourth value returns substring of fourth value',() {
      var result = PinCodeValidator.validateFourthNumber("1234");
      expect(result, "4");
    });

  });
  group('validate color', () {
    const fillColor = Colors.teal;
    const emptyColor = Colors.white;

    test('clearing  value returns empty color of selected  substring',() {
      var result = PinCodeValidator.validateFirstColor("");
      expect(result, emptyColor);
    });

    test('passing first value returns filled color',() {
      var result = PinCodeValidator.validateFirstColor("1");
      expect(result, fillColor);
    });

    test('passing second value returns filled color',() {
      var result = PinCodeValidator.validateSecondColor("12");
      expect(result, fillColor);
    });

    test('passing third value returns filled color',() {
      var result = PinCodeValidator.validateThirdColor("123");
      expect(result, fillColor);
    });

    test('passing fourth value returns filled color',() {
      var result = PinCodeValidator.validateFourthColor("1234");
      expect(result, fillColor);
    });
  });
}