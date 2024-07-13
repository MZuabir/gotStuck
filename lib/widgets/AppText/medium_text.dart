import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {
  final String text;
  final TextAlign? align;
  final TextStyle? style;
  const MediumText({
    super.key,
    required this.text,
    this.style,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          const TextStyle(
              fontFamily: 'Poppins', fontWeight: FontWeight.w400, fontSize: 14),
      textAlign: align,
    );
  }
}
