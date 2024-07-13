import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/config/helpers/responsive.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/RoundedButton.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';

import '../../config/app_icons.dart';
import '../../widgets/AppText/large_text.dart';
import '../../widgets/CustomTitleAppBar.dart';

class ReferScreen extends StatelessWidget {
  const ReferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomTitleAppBar(
          backGroundColor: AppColors.white, title: AppText.refer),
      body: SafeArea(
        child: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const CustomIconWidget(
                          icon: AppIcons.refer,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 5),
                          child: LargeText(
                            text: AppText.withGotStuck,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ),
                        const MediumText(text: AppText.referORinvite),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: LargeText(
                            text: AppText.fiveDollars,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                color: AppColors.appYellow),
                          ),
                        ),
                        const MediumText(
                          text: AppText.gotStuckIsGreat,
                          align: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 30),
                          child: RoundedButton(
                              text: AppText.inviteFriend,
                              onTap: () {
                                Fluttertoast.showToast(msg: 'Coming soon');
                              },
                              txtColor: AppColors.white,
                              backgroundColor: AppColors.black),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
