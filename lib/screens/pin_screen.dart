import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_screen/screens/widgets/exit_button.dart';
import 'package:pin_screen/screens/widgets/numeric_pad.dart';
import 'package:pin_screen/screens/widgets/pin_number_box.dart';
import 'package:pin_screen/screens/widgets/security_text.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: OtpScreen(),
      ),
    );
  }
}

// TODO make a separate widget
class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    height: 40.0,
                  ),
                  buildPinRow(),
                ],
              ),
            ),
          ),
          NumericPad(onNumberSelected: (value) {
            print(value);
            setState(() {
              if (value != -1) {
                if (code.length < 4) {
                  code = code + value.toString();
                }
              } else {
                code = code.substring(0, code.length - 1);
              }

              print(code);
            });
          }),
        ],
      ),
    );
  }

  buildPinRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PinNumberBox(codeNumber: code.length > 0 ? code.substring(0, 1) : "", color: code.length > 0 ? Colors.teal : Colors.white,),
          PinNumberBox(codeNumber: code.length > 1 ? code.substring(1, 2) : "", color: code.length > 1 ? Colors.teal : Colors.white,),
          PinNumberBox(codeNumber: code.length > 2 ? code.substring(2, 3) : "", color: code.length > 2 ? Colors.teal : Colors.white,),
          PinNumberBox(codeNumber: code.length > 3 ? code.substring(3, 4) : "", color: code.length > 3 ? Colors.teal : Colors.white,),
        ],
      ),
    );
  }

  // TODO Add text style Roboto
}
