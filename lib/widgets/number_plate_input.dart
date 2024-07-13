import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/colors.dart';

class Number_plate_input extends StatelessWidget {
  final TextInputAction inputAction;
  const Number_plate_input({
    super.key,
    required this.inputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 35,
        color: AppColors.white,
        child: TextField(
            textInputAction: inputAction,
            inputFormatters: [LengthLimitingTextInputFormatter(1)],
            keyboardType: TextInputType.streetAddress,
            style: const TextStyle(
                fontFamily: 'UKNumberPlate',
                fontSize: 46,
                fontWeight: FontWeight.w400),
            decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                contentPadding: EdgeInsets.only(left: 5, right: 5))));
  }
}
