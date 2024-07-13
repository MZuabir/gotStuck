import 'package:flutter/material.dart';

import '../config/colors.dart';
import 'AppText/medium_text.dart';
import 'SubTitleTextWidget.dart';
import 'customIconWidget.dart';

class CustomWalletTiles extends StatelessWidget {
  const CustomWalletTiles({
    super.key,
    required this.icon,
    required this.title,
    required this.date,
    required this.amount,
    this.style,
  });
  final String icon;
  final String title;
  final String date;
  final String amount;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  offset: Offset(0, 4),
                  blurRadius: 18,
                  spreadRadius: -4)
            ]),
        child: Row(
          children: [
            CustomIconWidget(icon: icon),
            Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MediumText(
                        text: title,
                        style: const TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                      SubTitleTextWidget(text: date)
                    ])),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: MediumText(
                  text: amount,
                  style: style ??
                      const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.red),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
