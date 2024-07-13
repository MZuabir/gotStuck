import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../config/colors.dart';

class OtpInputField extends StatelessWidget {
  const OtpInputField({
    super.key,
    required this.otpTxt, this.onChanged,
  });

  final TextEditingController otpTxt;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      onChanged: onChanged,
      closeKeyboardWhenCompleted: true,
      keyboardType: TextInputType.number,
      length: 6,
      controller: otpTxt,
      defaultPinTheme: PinTheme(
        textStyle: TextStyle(fontSize: 20),
        // width: 55,
        height: 55,
        decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
