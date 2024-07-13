import 'package:flutter/material.dart';
import 'package:got_stuck/config/app_text.dart';
import '../../config/colors.dart';
import '../../config/helpers/responsive.dart';
import '../../widgets/AppText/large_text.dart';
import '../../widgets/AppText/medium_text.dart';
import '../../widgets/CustomTitleAppBar.dart';
import '../../widgets/RoundedButton.dart';
import '../../widgets/SubTitleTextWidget.dart';
import '../../widgets/roundedTextInput.dart';
import '../RecoveryModule/RecoveryMainScreen.dart';
import 'BatteryImagesScreen.dart';
// import '../RecoveryScreen2/RecoveryScreen2.dart';

class BatteryMainScreen extends StatefulWidget {
  const BatteryMainScreen({super.key});

  @override
  State<BatteryMainScreen> createState() => _BatteryMainScreenState();
}

class _BatteryMainScreenState extends State<BatteryMainScreen> {
  bool jumpRecovery = false;
  bool cleaningRecovery = false;
  bool chargingRecovery = false;
  bool replacementRecovery = false;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.socialIcon,
        appBar: const CustomTitleAppBar(
          backGroundColor: AppColors.socialIcon,
          title: AppText.battery,
        ),
        body: SafeArea(
          child: SizedBox(
            height: screenHeight(context),
            width: screenWidth(context),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 70),
                            child: LargeText(
                              text: AppText.batteryServiceWant,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                              align: TextAlign.center,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20, top: 50),
                            child: MediumText(
                              text: AppText.selectServiceWant,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                              align: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              children: [
                                CustomCheckBoxItems(
                                  onTap: (value) {
                                    setState(() {
                                      jumpRecovery = value;
                                    });
                                  },
                                  text: AppText.jumpStartService,
                                  value: jumpRecovery,
                                ),
                                CustomCheckBoxItems(
                                  onTap: (value) {
                                    setState(() {
                                      cleaningRecovery = value;
                                    });
                                  },
                                  text: AppText.terminalCleaning,
                                  value: cleaningRecovery,
                                ),
                                CustomCheckBoxItems(
                                  onTap: (value) {
                                    setState(() {
                                      chargingRecovery = value;
                                    });
                                  },
                                  text: AppText.batteryCharging,
                                  value: chargingRecovery,
                                ),
                                CustomCheckBoxItems(
                                  onTap: (value) {
                                    setState(() {
                                      replacementRecovery = value;
                                    });
                                  },
                                  text: AppText.batteryReplacement,
                                  value: replacementRecovery,
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: SubTitleTextWidget(
                                text: AppText.carProblemInDetail),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: RoundedInputField(
                                fieldColor: AppColors.white,
                                hintTextColor: AppColors.grey,
                                controllerData: controller,
                                hintText: AppText.enterServiceDetailes,
                                inputType: TextInputType.text),
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RoundedButton(
                        text: AppText.next,
                        onTap: () {
                          setState(() {
                            FocusScope.of(context).unfocus();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const BatteryImagesScreen()));
                          });
                        },
                        txtColor: AppColors.white,
                        backgroundColor: AppColors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
