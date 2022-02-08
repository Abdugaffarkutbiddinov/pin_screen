import 'package:flutter/material.dart';

class PinNumberBox extends StatelessWidget {
  final String codeNumber;
  final Color color;
  const PinNumberBox({required this.codeNumber, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 28,
        height: 28,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: Center(
            child: Text(
              codeNumber.replaceAll(RegExp(r"."), ""),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1F1F),
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
