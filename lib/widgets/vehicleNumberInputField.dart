import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../config/colors.dart';

class VehicleNumberInputField extends StatelessWidget {
  final TextEditingController controller;
  const VehicleNumberInputField({
    super.key,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.5,
      width: 354,
      margin: const EdgeInsets.only(top: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.socialIcon,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        child: Pinput(
          // showCursor: false,
          enableSuggestions: false,
          closeKeyboardWhenCompleted: true,
          keyboardType: TextInputType.streetAddress,
          length: 7,
          controller: controller,
          defaultPinTheme: PinTheme(
              textStyle: const TextStyle(
                  fontSize: 46,
                  height: 1,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'UKNumberPlate'),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(0))),
        ),
      ),
    );
  }
}
