
import 'package:flutter/material.dart';

class SecurityText extends StatelessWidget {
  const SecurityText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Please enter PIN code',
      style: TextStyle(
        color: Colors.black87,
        fontSize: 24,
      ),
    );
  }
}
