import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  final String text;
  final TextAlign? align;
  final TextStyle? style;
  const LargeText({super.key, required this.text, this.align, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textScaleFactor: 1.0,
      style: style ??
          const TextStyle(
              fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 26),
      textAlign: align,
    );
  }
}
