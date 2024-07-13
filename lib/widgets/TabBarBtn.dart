import 'package:flutter/material.dart';
import 'package:got_stuck/config/helpers/responsive.dart';

import '../config/colors.dart';

class TabBarButton extends StatelessWidget {
  const TabBarButton({
    super.key,
    required this.tabController,
    required this.unselectedBtnColor,
    required this.selectedBtnColor,
    required this.Btn1Txt,
    required this.Btn2Txt,
  });

  final TabController tabController;
  final Color unselectedBtnColor;
  final Color selectedBtnColor;
  final String Btn1Txt;
  final String Btn2Txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context) / 13,
      // width: 360,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.5),
          color: AppColors.socialIcon,
          border: Border.all(color: AppColors.tabBorderColor, width: 2)),
      child: TabBar(
        indicatorPadding: EdgeInsets.symmetric(horizontal: 0),
        indicatorWeight: 3,
        // indicatorColor: Colors.orange,
        // labelColor: Colors.yellow,
        // labelPadding: EdgeInsets.zero,

        unselectedLabelColor: unselectedBtnColor,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(28.5), color: Colors.black),
        controller: tabController,
        isScrollable: false,
        labelPadding: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(2),
        tabs: [
          Text(
            Btn1Txt,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins'),
          ),
          Text(
            Btn2Txt,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
