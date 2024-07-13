// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:got_stuck/config/colors.dart';
// import 'package:phone_form_field/phone_form_field.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

// import '../config/colors.dart';

// ignore: must_be_immutable
class RoundedInputField extends StatefulWidget {
  final String hintText;
  final Color? hintTextColor;
  final Color? fieldColor;
  TextEditingController controllerData = TextEditingController();
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final ValueChanged? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final Color? cursorColor;
  final VoidCallback? onTap;
  final bool? redOnly;
  RoundedInputField({
    Key? key,
    required this.controllerData,
     this.redOnly,
    required this.hintText,
    this.validator,
    this.hintTextColor,
    this.fieldColor,
    required this.inputType,
    this.inputFormatters,
    this.onChanged,
    this.cursorColor,
    this.onTap,
  }) : super(key: key);

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.fieldColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onTap: widget.onTap,
        cursorColor: widget.cursorColor ?? AppColors.black,
        onChanged: widget.onChanged,
        inputFormatters: widget.inputFormatters,
        controller: widget.controllerData,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: widget.inputType,
        enableInteractiveSelection: true,
        readOnly: widget.redOnly??false,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: widget.hintTextColor,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none,
          // errorText: '',
          contentPadding:
              const EdgeInsets.only(bottom: 20, left: 20, top: 20, right: 20),
        ),
      ),
    );
  }
}
