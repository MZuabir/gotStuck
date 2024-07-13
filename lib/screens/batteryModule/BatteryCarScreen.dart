import 'package:flutter/material.dart';
import 'package:got_stuck/config/app_images.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/screens/batteryModule/BatteryLocationScreen.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/CarDetail.dart';
import 'package:got_stuck/widgets/RoundedButton.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';

import '../../config/app_icons.dart';
import '../../config/colors.dart';

class BatteryCarScreen extends StatefulWidget {
  const BatteryCarScreen({super.key});

  @override
  State<BatteryCarScreen> createState() => _BatteryCarScreenState();
}

class _BatteryCarScreenState extends State<BatteryCarScreen> {
  TextEditingController controller1 =
      TextEditingController(text: AppText.pickLocation);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar_CarDetailWidget(
            carDetailBuilder: CarDetail(
                carName: AppText.carName,
                carNumber: AppText.carNumber,
                countryName: 'UK'),
            title: AppText.battery),
        body: SafeArea(
          child: Column(children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 35),
                          child: MediumText(
                            text: AppText.vehicleLocation,
                            style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Row(
                          children: [
                            const CustomIconWidget(
                                icon: AppIcons.vehicleLocation),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          243, 246, 248, 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Stack(
                                    alignment: Alignment.centerRight,
                                    children: [
                                      TextField(
                                          readOnly: true,
                                          onTap: () {
                                            setState(() {});
                                          },
                                          controller: controller1,
                                          keyboardType:
                                              TextInputType.streetAddress,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 20))),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: CustomIconWidget(
                                            icon: AppIcons.crossBox),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: CustomIconWidget(
                        icon: AppImages.batteryScreenCar, height: 300),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: RoundedButton(
                            style: const TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: 'Poppins'),
                            text: AppText.confirmBooking,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BatteryLocationScreen(
                                            title: AppText.battery,
                                          )));
                            },
                            txtColor: AppColors.white,
                            backgroundColor: AppColors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
