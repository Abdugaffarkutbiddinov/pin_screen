import 'package:flutter/material.dart';
import 'package:pin_screen/screens/widgets/exit_button.dart';
import 'package:pin_screen/screens/widgets/numeric_pad.dart';
import 'package:pin_screen/screens/widgets/pin_number_box.dart';
import 'package:pin_screen/screens/widgets/security_text.dart';

class PinCodeValidator {
  static String validateFirstNumber(String code) =>
      code.length > 0 ? code.substring(0, 1) : "";

  static Color validateFirstColor(String code) =>
      code.length > 0 ? Colors.teal : Colors.white;

  static String validateSecondNumber(String code) =>
      code.length > 1 ? code.substring(1, 2) : "";

  static Color validateSecondColor(String code) =>
      code.length > 1 ? Colors.teal : Colors.white;

  static String validateThirdNumber(String code) =>
      code.length > 2 ? code.substring(2, 3) : "";

  static Color validateThirdColor(String code) =>
      code.length > 2 ? Colors.teal : Colors.white;

  static String validateFourthNumber(String code) =>
      code.length > 3 ? code.substring(3, 4) : "";

  static Color validateFourthColor(String code) =>
      code.length > 3 ? Colors.teal : Colors.white;
}

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ExitButton(),
            Expanded(
              child: Container(
                alignment: Alignment(0, 0.5),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SecurityText(),
                    SizedBox(
                      height: 60.0,
                    ),
                    _buildPinRow(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 223.0,
            ),
            NumericPad(onNumberSelected: (value) {
              setState(() {
               _selectValue(value);
              });
            }),
          ],
        ),
      ),
    );
  }

  _selectValue(int value) {
    if (value != -1) {
      if (code.length < 4) {
        code = code + value.toString();
      }
    } else if (code.isEmpty) {
      print('nothing to delete');
    } else {
      code = code.substring(0, code.length - 1);
    }
  }
  _buildPinRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PinNumberBox(
            codeNumber: PinCodeValidator.validateFirstNumber(code),
            color: PinCodeValidator.validateFirstColor(code),
          ),
          PinNumberBox(
            codeNumber: PinCodeValidator.validateSecondNumber(code),
            color: PinCodeValidator.validateSecondColor(code),
          ),
          PinNumberBox(
            codeNumber: PinCodeValidator.validateThirdNumber(code),
            color: PinCodeValidator.validateThirdColor(code),
          ),
          PinNumberBox(
            codeNumber: PinCodeValidator.validateFourthNumber(code),
            color: PinCodeValidator.validateFourthColor(code),
          ),
        ],
      ),
    );
  }
}
