import 'package:flutter/material.dart';

import '../../config/colors.dart';

class PrimaryText extends StatelessWidget {
  final TextAlign? align;
  final String text;
  final TextStyle? style;
  const PrimaryText({
    super.key,
    required this.text,
    this.style,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textScaleFactor: 1.0,
      style: style ??
          const TextStyle(
              fontSize: 16,
              height: 1.3,
              color: AppColors.resendBtn,
              fontFamily: 'Poppins'),
      textAlign: align ?? TextAlign.center,
    );
  }
}
