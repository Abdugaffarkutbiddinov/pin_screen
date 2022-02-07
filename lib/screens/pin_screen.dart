import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_screen/screens/numeric_pad.dart';

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
  List<String> currentPin = ["", "", "", ""];
  TextEditingController pinFirstController = TextEditingController();
  TextEditingController pinSecondController = TextEditingController();
  TextEditingController pinThirdController = TextEditingController();
  TextEditingController pinFourthController = TextEditingController();

  final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(50.0),
    borderSide: const BorderSide(color: Colors.transparent),
  );
  int pinIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          buildExitButton(),
          Expanded(
            child: Container(
              alignment: Alignment(0, 0.5),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildSecurityText(),
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
         }),
        ],
      ),
    );
  }

  buildNumberPad() {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // TODO create const strings
                  KeyboardNumber(
                      number: 1,
                      onPressed: () {
                        setState(() {
                          pinIndexSetup("1");
                        });
                      }),
                  KeyboardNumber(
                      number: 2,
                      onPressed: () {
                        pinIndexSetup("2");
                      }),
                  KeyboardNumber(
                      number: 3,
                      onPressed: () {
                        pinIndexSetup("3");
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // TODO create const strings
                  KeyboardNumber(
                      number: 4,
                      onPressed: () {
                        pinIndexSetup("4");
                      }),
                  KeyboardNumber(
                      number: 5,
                      onPressed: () {
                        pinIndexSetup("5");
                      }),
                  KeyboardNumber(
                      number: 6,
                      onPressed: () {
                        pinIndexSetup("6");
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // TODO create const strings
                  KeyboardNumber(
                      number: 7,
                      onPressed: () {
                        pinIndexSetup("7");
                      }),
                  KeyboardNumber(
                      number: 8,
                      onPressed: () {
                        pinIndexSetup("8");
                      }),
                  KeyboardNumber(
                      number: 9,
                      onPressed: () {
                        pinIndexSetup("9");
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // TODO create const strings
                  Container(
                    width: 60.0,
                    child: MaterialButton(
                      height: 60.0,
                      onPressed: () {},
                      child: Icon(
                        Icons.fingerprint_rounded,
                        size: 34,
                      ),
                    ),
                  ),
                  KeyboardNumber(
                      number: 0,
                      onPressed: () {
                        pinIndexSetup("0");
                      }),
                  Container(
                    width: 60.0,
                    child: MaterialButton(
                      height: 60.0,
                      onPressed: () {
                        clearPin();
                      },
                      child: Icon(
                        Icons.backspace_outlined,
                        size: 34,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  clearPin() {
    if (pinIndex == 0) {
      pinIndex = 0;
    } else if (pinIndex == 4) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  pinIndexSetup(String text) {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 4) {
      pinIndex++;
    }
    setPin(pinIndex, text);
    currentPin[pinIndex - 1] = text;
    String strPin = "";
    currentPin.forEach((element) {
      strPin += element;
    });
    if (pinIndex == 4) {
      print(strPin);
    }
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinFirstController.text = text;
        break;
      case 2:
        pinSecondController.text = text;
        break;
      case 3:
        pinThirdController.text = text;
        break;
      case 4:
        pinFourthController.text = text;
        break;
    }
  }

  buildPinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinFirstController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinSecondController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinThirdController,
        ),
        PINNumber(
          outlineInputBorder: outlineInputBorder,
          textEditingController: pinFourthController,
        ),
      ],
    );
  }

  // TODO Add text style Roboto
  buildSecurityText() {
    return const Text(
      'Please enter PIN code',
      style: TextStyle(
        color: Colors.black87,
        fontSize: 24,
      ),
    );
  }

  buildExitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: () {},
            height: 50.0,
            minWidth: 50.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Icon(
              Icons.help_outline_rounded,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;

  PINNumber(
      {required this.textEditingController, required this.outlineInputBorder});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28.0,
      height: 28.0,
      child: TextField(
        controller: textEditingController,
        enabled: false,
        obscureText: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.0),
          border: outlineInputBorder,
          // filled: true,
          // fillColor: Colors.teal
        ),
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 5.0, color: Colors.black),
      ),
    );
  }
}

class KeyboardNumber extends StatelessWidget {
  final int number;
  final Function()? onPressed;

  const KeyboardNumber({required this.number, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,
        // height: 90.0,
        child: Text(
          "$number",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 34 * MediaQuery.of(context).textScaleFactor,
              color: Colors.black87,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
