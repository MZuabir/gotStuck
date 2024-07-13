import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/colors.dart';
import 'AppText/large_text.dart';
import 'AppText/medium_text.dart';

class CustomNumberPlateDetailWidget extends StatelessWidget {
  const CustomNumberPlateDetailWidget(
      {super.key,
      required this.countryName,
      required this.carNumber,
      this.heigth,
      this.width});

  final String countryName;
  final String carNumber;
  final double? heigth;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 43,
          height: 40,
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 20,
                  spreadRadius: 6,
                  color: Color.fromRGBO(0, 0, 0, 0.08),
                )
              ],
              color: Colors.black,
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(3),
                  bottomStart: Radius.circular(3))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/dotedCircle.svg'),
              MediumText(
                text: countryName,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
                align: TextAlign.center,
              )
            ],
          ),
        ),
        Container(
          width: 115,
          height: 40,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.black, width: 1),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.08),
                    spreadRadius: 6,
                    blurRadius: 20,
                    offset: Offset(0, 4))
              ],
              // color: Colors.orange,
              borderRadius: const BorderRadiusDirectional.only(
                  topEnd: Radius.circular(3), bottomEnd: Radius.circular(3))),
          child: Padding(
            padding: const EdgeInsets.only(top: 0, right: 0, left: 0),
            child: LargeText(
              text: carNumber,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'UKNumberPlate',
                fontWeight: FontWeight.w400,
              ),
              align: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
