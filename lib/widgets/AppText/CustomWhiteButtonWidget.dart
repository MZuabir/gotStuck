import 'package:flutter/material.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';

class CustomWhiteButtonWidget extends StatelessWidget {
  const CustomWhiteButtonWidget(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.text,
      this.style,
      this.width});
  final VoidCallback onTap;
  final String icon;
  final String text;
  final TextStyle? style;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 150,
      // padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 14,
                spreadRadius: 24,
                color: Color.fromRGBO(0, 0, 0, 0.02))
          ]),
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: onTap,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconWidget(icon: icon),
                  Padding(
                    padding: const EdgeInsets.only(left: 7, right: 0),
                    child: MediumText(
                        text: text,
                        style: style ??
                            const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: AppColors.black)),
                  )
                ],
              ))),
    );
  }
}
