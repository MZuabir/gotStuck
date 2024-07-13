import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:got_stuck/config/app_images.dart';
import 'package:got_stuck/config/app_text.dart';
// import 'package:got_stuck/screens/BatteryLocationScreen/BatteryLocationScreen.dart';
// import 'package:got_stuck/screens/RecoveryModule/RecoveryScreen2.dart';
import 'package:got_stuck/screens/batteryModule/BatteryArrivalScreen.dart';
import 'package:got_stuck/screens/homeScreen/HomeScreen.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/SubTitleTextWidget.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';

import '../../config/app_icons.dart';
import '../../config/colors.dart';
import '../../config/helpers/responsive.dart';
import '../../widgets/AppText/large_text.dart';
import '../../widgets/CarDetail.dart';
import '../../widgets/RoundedButton.dart';
import '../../widgets/TitleTextWidget.dart';
import '../CarWashModule/CarWashMainScreen.dart';
import '../ChatScreen/ChatPage.dart';
import '../batteryModule/BatteryLocationScreen.dart';

class RecoveryArrivalScreen extends StatefulWidget {
  const RecoveryArrivalScreen({super.key});

  @override
  State<RecoveryArrivalScreen> createState() => _RecoveryArrivalScreenState();
}

class _RecoveryArrivalScreenState extends State<RecoveryArrivalScreen> {
  static const CameraPosition pos =
      CameraPosition(target: LatLng(51.534497, -0.034000), zoom: 14.4746);

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   ShowBottomSheet(context);
    // startTimer();
    // });
  }

  // @override
  // void dispose() {
  //   timer?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.socialIcon,
      appBar: CustomAppBar_CarDetailWidget(
          title: AppText.recovery,
          carDetailBuilder: CarDetail(
              carName: AppText.carName,
              carNumber: AppText.carNumber,
              countryName: 'UK')),
      // AppBar(
      //     scrolledUnderElevation: 0,
      //     shape: const RoundedRectangleBorder(
      //         borderRadius: BorderRadius.only(
      //             bottomLeft: Radius.circular(20),
      //             bottomRight: Radius.circular(20))),
      //     backgroundColor: AppColors.white,
      //     automaticallyImplyLeading: false,
      //     centerTitle: true,
      //     // toolbarHeight: 145,
      //     leading: Padding(
      //       padding: const EdgeInsets.only(left: 0),
      //       child: IconButton(
      //           // splashRadius: 20,
      //           onPressed: () {
      //             Navigator.pop(context);
      //           },
      //           icon: SvgPicture.asset(AppIcons.backArrow)),
      //     ),
      //     title: const LargeText(
      //       text: AppText.recovery,
      //       style: TextStyle(
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w600,
      //           fontSize: 24),
      //     ),
      //     bottom: const PreferredSize(
      //         preferredSize: Size(double.infinity, 100),
      //         child: CarDetail(
      //             carName: AppText.carName,
      //             carNumber: AppText.carNumber,
      //             countryName: 'UK'))),
      // Column(
      //   children: [
      //     Row(children: [
      //       IconButton(
      //           splashRadius: 20,
      //           onPressed: () {
      //             Navigator.pop(context);
      //           },
      //           icon: SvgPicture.asset(AppIcons.backArrow)),
      //       const Expanded(
      //         child: Padding(
      //           padding: EdgeInsets.only(left: 70),
      //           child: LargeText(
      //             text: AppText.recovery,
      //             style: TextStyle(
      //                 fontFamily: 'Poppins',
      //                 fontWeight: FontWeight.w600,
      //                 fontSize: 24),
      //           ),
      //         ),
      //       )
      //     ]),
      //     CarDetail(
      //         height: height <= 640
      //             ? screenHeight(context) / 7.8
      //             : screenHeight(context) / 8,
      //         dotsLeftSpacing: screenWidth(context) / 2.4,
      //         dotsBottomSpacing: height <= 640
      //             ? screenWidth(context) / 90
      //             : screenWidth(context) / 30,
      //         carName: AppText.carName,
      //         carNumber: AppText.carNumber,
      //         countryName: AppText.uk)
      //   ],
      // ),

      body: Column(
        children: [
          SizedBox(
            height: 450,
            child: GoogleMap(initialCameraPosition: pos),
          )
        ],
      ),
      bottomSheet: ModalBottomSheetWidget(),
    );
  }
}

class ModalBottomSheetWidget extends StatefulWidget {
  const ModalBottomSheetWidget({super.key});

  @override
  State<ModalBottomSheetWidget> createState() => _ModalBottomSheetWidgetState();
}

class _ModalBottomSheetWidgetState extends State<ModalBottomSheetWidget> {
  String text = AppText.serviceProviderArriving;

  int seconds = 0;

  Timer? timer;

  void startTimer() {
    if (timer != null) {
      timer?.cancel();
    }
    seconds = 0;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
        if (seconds == 10) {
          seconds = 0;
          timer.cancel();
        }
        if (seconds <= 5) {
          text = AppText.serviceProviderArriving;
        } else if (seconds > 5 && seconds < 7) {
          text = AppText.serviceProviderArrivingSoon;
        } else if (seconds >= 7 && seconds < 10) {
          text = AppText.serviceProviderArrived;
        } else if (seconds == 10) {
          text = AppText.serviceProviderArrived;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = screenHeight(context);
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          color: AppColors.white,
          height: height > 640 ? 430 : 411, //430
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 70, left: 20),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 25),
                                child: MediumText(text: AppText.pickLocation)),
                            Padding(
                                padding: EdgeInsets.only(top: 30, left: 25),
                                child: MediumText(
                                  text: AppText.saleemMechanic,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ))
                          ],
                        ),
                        Column(
                          children: [
                            CustomIconWidget(
                                icon: AppIcons.smallVehicleLocation),
                            CustomIconWidget(icon: AppIcons.smallVerticleLine),
                            CustomIconWidget(
                                icon: AppIcons.smallDropOffLocation),
                          ],
                        )
                      ],
                    ),
                  ),
                  ArrivalScreensServiceDetailsContainer(
                    onTap: () {
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              contentPadding: EdgeInsets.zero,
                              insetPadding: EdgeInsets.zero,
                              content: ContentBoxWidget(),
                            );
                          },
                        );
                      });
                    },
                    approxTime: '04:00 min',
                    carName: AppText.nissanAtlas,
                    distance: '4.2 mi',
                    estmateTime: '15:00 min',
                    number: '078',
                    price: '5.99',
                    rating: '4.9',
                    shopName: AppText.jackAuto,
                    title: AppText.recovery,
                  ),
                ],
              ),
              Transform.translate(
                offset: const Offset(0, -30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    height: 66,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.white,
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 43,
                              spreadRadius: -6,
                              color: Color.fromRGBO(90, 90, 90, 0.25))
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LargeText(
                          text: text,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        const MediumText(text: AppText.gotoPickup),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class ContentBoxWidget extends StatelessWidget {
  ContentBoxWidget({super.key});
  double rating = 3;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          height: 500,
          width: screenWidth(context) * 0.9,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                    color: AppColors.appYellow,
                    borderRadius: BorderRadius.circular(10)),
                child: const Column(
                  children: [
                    MediumText(
                      text: AppText.yourServiceIs,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white),
                    ),
                    TitleTextWidget(
                      text: AppText.completed,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 10, left: 15),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MediumText(
                              text: AppText.serviceNois,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              )),
                          SubTitleTextWidget(text: 'Date: 20-june-2023')
                        ],
                      ),
                    ),
                    const Row(
                      children: [
                        CustomIconWidget(icon: AppIcons.redLocation),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: MediumText(text: AppText.pickLocation))
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Row(
                        children: [
                          CustomIconWidget(icon: AppIcons.toolLocation),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: MediumText(text: AppText.jackAuto)),
                          MediumText(
                            text: '4.9',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child:
                                  CustomIconWidget(icon: AppIcons.ratingStar))
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomIconWidget(icon: AppIcons.showLocation),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: MediumText(
                              text: '3.1',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: CustomIconWidget(
                              icon: 'assets/icons/smallDottedLine.svg',
                            ),
                          ),
                          CustomIconWidget(icon: AppIcons.time),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: MediumText(
                              text: '8 min',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: CustomIconWidget(
                              icon: 'assets/icons/smallDottedLine.svg',
                            ),
                          ),
                          CustomIconWidget(icon: AppIcons.payment),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: MediumText(
                              text: '8.92',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: const Color.fromRGBO(233, 233, 233, 1)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            const MediumText(
                              text: AppText.giveFeedback,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                              align: TextAlign.center,
                            ),
                            CustomRatingWidget(
                                size: 30,
                                rating: rating,
                                selectedColor: AppColors.appYellow,
                                unselectedColor: AppColors.grey,
                                onChanged: (val) {
                                  setState(() {
                                    rating = val;
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                    RoundedButton(
                        text: AppText.okay,
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                              (Route<dynamic> route) => false);
                        },
                        txtColor: AppColors.white,
                        backgroundColor: AppColors.black)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RichText(
                  text: TextSpan(
                      text: AppText.faceAnyIssue,
                      style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey),
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatPage()));
                              },
                            text: AppText.clickHere,
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black))
                      ]),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
