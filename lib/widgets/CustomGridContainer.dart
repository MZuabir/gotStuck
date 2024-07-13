import 'package:flutter/material.dart';
// import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';

// import '../config/helpers/responsive.dart';
// import '../dataModels/tabDataModel.dart';

class CustomGridContainer extends StatelessWidget {
  const CustomGridContainer({
    super.key,
    required this.icon,
    required this.text,
  });
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 100,
      decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.03),
                blurRadius: 20,
                offset: Offset(0, 0),
                spreadRadius: 6)
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconWidget(
            icon: icon,
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              text,
              style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
