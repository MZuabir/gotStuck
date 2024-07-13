import 'package:flutter/material.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
// import 'package:got_stuck/config/helpers/responsive.dart';
import 'package:got_stuck/screens/RecoveryModule/RecoveryScreen2.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/RoundedButton.dart';
import 'package:got_stuck/widgets/SubTitleTextWidget.dart';
import 'package:got_stuck/widgets/roundedTextInput.dart';
import '../../widgets/AppText/large_text.dart';
import '../../widgets/CustomTitleAppBar.dart';

class RecoveryMainScreen extends StatefulWidget {
  const RecoveryMainScreen({super.key});

  @override
  State<RecoveryMainScreen> createState() => _RecoveryMainScreenState();
}

class _RecoveryMainScreenState extends State<RecoveryMainScreen> {
  final List<String> options = [
    AppText.accRecovey,
    AppText.blueRecovery,
    AppText.lightRecovery,
    AppText.heavyRecovery,
    AppText.roadworksRecovery,
    AppText.slideRecovery,
    AppText.slideRecovery,
    AppText.serviceVanRecovery,
    AppText.other
  ];
  TextEditingController controller = TextEditingController();
  bool accRecovery = false;
  bool blueRecovery = false;
  bool lightRecovery = false;
  bool heavyRecovery = false;
  bool roadRecovery = false;
  bool slideRecovery = false;
  bool trailerRecovery = false;
  bool serviceRecovery = false;
  bool other = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.socialIcon,
        appBar: const CustomTitleAppBar(
            backGroundColor: AppColors.socialIcon, title: AppText.recovery),
        body: SafeArea(
            child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: LargeText(
                      text: AppText.typeOfRecoveryServiceWant,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      align: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      // padding: EdgeInsets.only(
                      //     bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 50, left: 18),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                children: [
                                  CustomCheckBoxItems(
                                    onTap: (value) {
                                      setState(() {
                                        accRecovery = value;
                                      });
                                    },
                                    text: AppText.accRecovey,
                                    value: accRecovery,
                                  ),
                                  CustomCheckBoxItems(
                                    onTap: (value) {
                                      setState(() {
                                        blueRecovery = value;
                                      });
                                    },
                                    text: AppText.blueRecovery,
                                    value: blueRecovery,
                                  ),
                                  CustomCheckBoxItems(
                                    onTap: (value) {
                                      setState(() {
                                        lightRecovery = value;
                                      });
                                    },
                                    text: 'Light Recovery',
                                    value: lightRecovery,
                                  ),
                                  CustomCheckBoxItems(
                                    onTap: (value) {
                                      setState(() {
                                        heavyRecovery = value;
                                      });
                                    },
                                    text: AppText.heavyRecovery,
                                    value: heavyRecovery,
                                  ),
                                  CustomCheckBoxItems(
                                    onTap: (value) {
                                      setState(() {
                                        roadRecovery = value;
                                      });
                                    },
                                    text: AppText.roadworksRecovery,
                                    value: roadRecovery,
                                  ),
                                  CustomCheckBoxItems(
                                    onTap: (value) {
                                      setState(() {
                                        slideRecovery = value;
                                      });
                                    },
                                    text: AppText.slideRecovery,
                                    value: slideRecovery,
                                  ),
                                  CustomCheckBoxItems(
                                    onTap: (value) {
                                      setState(() {
                                        trailerRecovery = value;
                                      });
                                    },
                                    text: AppText.trailersRecovery,
                                    value: trailerRecovery,
                                  ),
                                  CustomCheckBoxItems(
                                    onTap: (value) {
                                      setState(() {
                                        serviceRecovery = value;
                                      });
                                    },
                                    text: AppText.serviceVanRecovery,
                                    value: serviceRecovery,
                                  ),
                                  CustomCheckBoxItems(
                                    onTap: (value) {
                                      setState(() {
                                        other = value;
                                      });
                                    },
                                    text: AppText.other,
                                    value: other,
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
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 20),
                              child: RoundedInputField(
                                  fieldColor: AppColors.white,
                                  hintTextColor: AppColors.grey,
                                  controllerData: controller,
                                  hintText: AppText.enterServiceDetailes,
                                  inputType: TextInputType.text),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.orange,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: RoundedButton(
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white),
                          text: AppText.next,
                          onTap: () {
                            setState(() {
                              FocusScope.of(context).unfocus();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RecoveryScreen2()));
                            });
                          },
                          txtColor: AppColors.white,
                          backgroundColor: AppColors.black),
                    ),
                  )
                ]),
          ),
        )));
  }
}

class CustomCheckBoxItems extends StatelessWidget {
  const CustomCheckBoxItems({
    super.key,
    required this.value,
    required this.text,
    required this.onTap,
  });
  final String text;
  final bool value;
  final ValueChanged onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            side: const BorderSide(
                color: Color.fromRGBO(194, 195, 203, 1), width: 2),
            activeColor: AppColors.appYellow,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            value: value,
            onChanged: onTap),
        MediumText(
          text: text,
          style: const TextStyle(
              fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 16),
        )
      ],
    );
  }
}
