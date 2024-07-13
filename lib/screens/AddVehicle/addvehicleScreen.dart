import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:got_stuck/config/app_icons.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/screens/NumberPlate/numberPlateScreen.dart';
import 'package:got_stuck/screens/homeScreen/HomeScreen.dart';
import 'package:got_stuck/widgets/AppText/large_text.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/RoundedButton.dart';

import '../../widgets/skipButton.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({super.key});

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50, left: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MediumText(text: AppText.selectYour),
                      LargeText(
                        text: AppText.vehicleNumber,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 24),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 40, right: 5),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: SkipButton(onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                            (Route<dynamic> route) => false);
                      }),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              // color: Colors.green,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 56,
                    width: double.infinity,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: AppColors.socialIcon,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NumberPlateScreen()));
                        },
                        child: SvgPicture.asset(AppIcons.addVehicle)),
                  )),
            ),
            Expanded(
              child: SizedBox(
                // height: MediaQuery.of(context).size.height / 2.4,
                width: double.infinity,
                // color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RoundedButton(
                        text: 'Browse',
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                              (Route<dynamic> route) => false);
                        },
                        txtColor: AppColors.white,
                        backgroundColor: AppColors.black),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
