import 'package:flutter/material.dart';

import '../config/colors.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key,
    required this.text,
    this.style,
    this.align,
  });
  final String text;
  final TextStyle? style;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.black),
    );
  }
}
