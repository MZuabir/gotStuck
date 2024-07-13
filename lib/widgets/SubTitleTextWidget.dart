import 'package:flutter/material.dart';

import '../config/colors.dart';

class SubTitleTextWidget extends StatelessWidget {
  const SubTitleTextWidget({
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
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.subTitle),
      textAlign: align,
    );
  }
}
