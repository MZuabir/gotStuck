import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:got_stuck/config/app_icons.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/config/helpers/responsive.dart';
import 'package:got_stuck/widgets/AppText/large_text.dart';
import 'package:got_stuck/widgets/RoundedButton.dart';
import 'package:got_stuck/widgets/vehicleNumberInputField.dart';

class ConfirmVehicleScreen extends StatefulWidget {
  const ConfirmVehicleScreen({super.key});

  @override
  State<ConfirmVehicleScreen> createState() => _ConfirmVehicleScreenState();
}

class _ConfirmVehicleScreenState extends State<ConfirmVehicleScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SizedBox(
            height: screenHeight(context),
            width: screenWidth(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                children: [
                  Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(AppIcons.backArrow),
                        Container(
                          height: 72,
                          width: 192,
                          margin: const EdgeInsets.only(left: 40),
                          // color: Colors.orange,
                          child: const LargeText(
                            text: AppText.confirmYourVehicle,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 24),
                            align: TextAlign.center,
                          ),
                        ),
                      ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: VehicleNumberInputField(
                      controller: controller,
                    ),
                  ),
                  RoundedButton(
                      text: AppText.apply,
                      onTap: () {},
                      txtColor: AppColors.white,
                      backgroundColor: AppColors.black),

                  //           Container(
                  // width: MediaQuery.of(context).size.width / 1.1,
                  // height: MediaQuery.of(context).size.height / 15,
                  // padding: const EdgeInsets.only(left: 20),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(10),
                  //   color: AppColors.socialIcon,
                  // ),
                  // child: Row(
                  //   children: [
                  //     Container(
                  //       height: 30,
                  //       width: 30,
                  //       // color: Colors.black,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(40),
                  //       ),
                  //       child: Image.asset(
                  //         image,
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 20,
                  //     ),
                  //     Text(
                  //       text,
                  //       style: const TextStyle(
                  //           fontWeight: FontWeight.w700,
                  //           fontFamily: 'Manrope',
                  //           fontSize: 14),
                  //     ),
                  //   ],
                  // )),
                ],
              ),
            )),
      ),
    );
  }
}
