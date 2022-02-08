import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumericPad extends StatelessWidget {

  final Function(int) onNumberSelected;

  NumericPad({required this.onNumberSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildNumber(1),
                  buildNumber(2),
                  buildNumber(3),
                ],
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildNumber(4),
                buildNumber(5),
                buildNumber(6),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildNumber(7),
                buildNumber(8),
                buildNumber(9),
              ],
            ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildFingerPrint(),
                  buildNumber(0),
                  buildBackspace(),
                ],
              ),

          ],
        ),
      ),
    );
  }

  Widget buildNumber(int number) {
    return Container(
      width: 60.0,
      height: 60.0,
      alignment: Alignment.center,
      child: MaterialButton(
        key: Key('number${number.toString()}'),
        padding: EdgeInsets.all(8.0),
        onPressed: () {
          onNumberSelected(number);
        } ,
        // height: 90.0,
        child: Text(
          "$number",
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
              fontSize: 34 ,
              color: Colors.black87,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }

  Widget buildBackspace() {
    return Container(
      width: 60.0,
      child: MaterialButton(
        key: const Key('backspace'),
        height: 60.0,
        onPressed: () {
          onNumberSelected(-1);
        },
        child: Icon(
          Icons.backspace_outlined,
          size: 34,
        ),
      ),
    );
  }

  Widget buildFingerPrint() {
    return  Container(
      width: 60.0,
      child: MaterialButton(
        height: 60.0,
        onPressed: () {},
        child: Icon(
          Icons.fingerprint_rounded,
          size: 34,
        ),
      ),
    );
  }

}