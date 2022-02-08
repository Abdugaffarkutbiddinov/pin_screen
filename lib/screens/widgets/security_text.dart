import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecurityText extends StatelessWidget {
  const SecurityText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Please enter PIN code',
      style: GoogleFonts.roboto(color: Colors.black87, fontSize: 24),
    );
  }
}
