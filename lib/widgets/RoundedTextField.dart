import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/app_images.dart';
import '../config/colors.dart';

class Rounded_text_field extends StatelessWidget {
  final String hintText;
  final TextInputType type;
  final bool Enabled;
  final TextEditingController controller;
  final VoidCallback onTap;
  final bool? readOnly;
  final List<TextInputFormatter>? formatters;
  final VoidCallback? onTextFieldTap;
  const Rounded_text_field({
    super.key,
    // required this.text,
    required this.onTap,
    this.Enabled = false,
    required this.hintText,
    required this.controller,
    required this.type,
    this.formatters,
    this.readOnly = false, this.onTextFieldTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(46, 64, 77, 0.15),
                spreadRadius: -1,
                blurRadius: 22,
                offset: Offset(0, 10), // changes position of shadow
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  onTap: onTextFieldTap,
                  readOnly: readOnly == true ? true : false,
                  inputFormatters: formatters,
                  keyboardType: type,
                  controller: controller,
                  cursorColor: AppColors.appYellow,
                  enabled: Enabled,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins'),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      border: InputBorder.none,
                      hintText: hintText),
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  // margin: EdgeInsets.only(
                  //     left: MediaQuery.of(context).size.height / 4.7),
                  padding: const EdgeInsets.only(right: 20, left: 5),
                  child: Image.asset(
                    AppImages.Edit,
                    height: 26.48,
                    width: 25.94,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
