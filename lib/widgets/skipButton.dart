import 'package:flutter/material.dart';

import '../config/app_text.dart';
import '../config/colors.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback? onTap;
  final TextAlign? align;
  const SkipButton({
    super.key,
    required this.onTap,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onTap,
        child: Text(
          AppText.skip,
          style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.black),
          textAlign: align,
        ));
  }
}
