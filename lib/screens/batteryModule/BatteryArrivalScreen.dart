// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:got_stuck/config/app_images.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/screens/batteryModule/BatteryLocationScreen.dart';

import '../../config/app_icons.dart';
import '../../config/colors.dart';
import '../../config/helpers/responsive.dart';
import '../../widgets/AppText/large_text.dart';
import '../../widgets/AppText/medium_text.dart';
import '../../widgets/CarDetail.dart';
// import '../../widgets/RoundedButton.dart';
import '../../widgets/SubTitleTextWidget.dart';
// import '../../widgets/TitleTextWidget.dart';
import '../../widgets/customIconWidget.dart';
// import '../CarWashModule/CarWashMainScreen.dart';
import '../ChatScreen/ChatPage.dart';
// import '../RecoveryModule/RecoveryScreen2.dart';
// import '../homeScreen/HomeScreen.dart';

class BatteryArrivalScreen extends StatefulWidget {
  const BatteryArrivalScreen({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<BatteryArrivalScreen> createState() => _BatteryArrivalScreenState();
}

class _BatteryArrivalScreenState extends State<BatteryArrivalScreen> {
  static const CameraPosition pos =
      CameraPosition(target: LatLng(51.534497, -0.034000), zoom: 14.4746);

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   ShowBottomSheet(context);
    //   startTimer();
    // });
  }

  // @override
  // void dispose() {
  //   timer?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.socialIcon,
      appBar: CustomAppBar_CarDetailWidget(
          title: widget.title,
          carDetailBuilder: const CarDetail(
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
      //       padding: const EdgeInsets.only(left: 10),
      //       child: IconButton(
      //           splashRadius: 20,
      //           onPressed: () {
      //             Navigator.pop(context);
      //           },
      //           icon: SvgPicture.asset(AppIcons.backArrow)),
      //     ),
      //     title: LargeText(
      //       text: widget.title,
      //       style: const TextStyle(
      //           fontFamily: 'Poppins',
      //           fontWeight: FontWeight.w600,
      //           fontSize: 24),
      //     ),
      //     bottom: const PreferredSize(
      //         preferredSize: Size(double.infinity, 100),
      //         child: CarDetail(
      //             carName: AppText.carName,
      //             carNumber: AppText.carNumber,
      //             countryName: 'UK'))
      // Column(
      //   children: [
      //     Row(children: [
      //       IconButton(
      //           splashRadius: 20,
      //           onPressed: () {
      //             Navigator.pop(context);
      //           },
      //           icon: SvgPicture.asset(AppIcons.backArrow)),
      //       Expanded(
      //         child: Center(
      //           child: Padding(
      //               padding: const EdgeInsets.only(right: 50),
      //               child: LargeText(
      //                 text: widget.title,
      //                 style: const TextStyle(
      //                     fontFamily: 'Poppins',
      //                     fontWeight: FontWeight.w600,
      //                     fontSize: 24),
      //               )),
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
      // ),
      body: const Column(
        children: [
          SizedBox(
            height: 450,
            child: GoogleMap(initialCameraPosition: pos),
          )
        ],
      ),
      bottomSheet: BottomSheetBatteryArrival(title: widget.title),
    );
  }
}

class BottomSheetBatteryArrival extends StatefulWidget {
  const BottomSheetBatteryArrival({super.key, required this.title});
  final String title;

  @override
  State<BottomSheetBatteryArrival> createState() =>
      _BottomSheetBatteryArrivalState();
}

class _BottomSheetBatteryArrivalState extends State<BottomSheetBatteryArrival> {
  double rating = 3;

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
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = screenHeight(context);
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          color: AppColors.white,
          height: height > 640 ? 380 : 380,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 70, left: 20, bottom: 5),
                    child: Row(
                      children: [
                        CustomIconWidget(icon: AppIcons.smallVehicleLocation),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: MediumText(
                            text: AppText.pickLocation,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    // child: Stack(
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       children: [
                    //         Padding(
                    //             padding: EdgeInsets.only(left: 25),
                    //             child: MediumText(text: AppText.pickLocation)),
                    //         Padding(
                    //             padding: EdgeInsets.only(top: 30, left: 25),
                    //             child: MediumText(
                    //               text: AppText.saleemMechanic,
                    //               style: TextStyle(
                    //                   fontFamily: 'Poppins',
                    //                   fontWeight: FontWeight.w400,
                    //                   fontSize: 14),
                    //             ))
                    //       ],
                    //     ),
                    //     Column(
                    //       children: [
                    //         CustomIconWidget(
                    //             icon: AppIcons.smallVehicleLocation),
                    //         CustomIconWidget(icon: AppIcons.smallVerticleLine),
                    //         CustomIconWidget(
                    //             icon: AppIcons.smallDropOffLocation),
                    //       ],
                    //     )
                    //   ],
                    // ),
                  ),
                  ArrivalScreensServiceDetailsContainer(
                    onTap: () {},
                    approxTime: '04:00 min',
                    carName: AppText.nissanAtlas,
                    distance: '4.2 mi',
                    estmateTime: '15:00 min',
                    number: '078',
                    price: '5.99',
                    rating: '4.9',
                    shopName: AppText.jackAuto,
                    title: widget.title,
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

class ArrivalScreensServiceDetailsContainer extends StatelessWidget {
  const ArrivalScreensServiceDetailsContainer({
    Key? key,
    required this.onTap,
    required this.shopName,
    required this.rating,
    required this.number,
    required this.price,
    required this.distance,
    required this.approxTime,
    required this.estmateTime,
    required this.title,
    required this.carName,
  }) : super(key: key);
  final VoidCallback onTap;
  final String shopName;
  final String rating;
  final String number;
  final String price;
  final String distance;
  final String approxTime;
  final String estmateTime;
  final String title;
  final String carName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 20,
                    spreadRadius: 6,
                    color: Color.fromRGBO(0, 0, 0, 0.06))
              ],
              borderRadius: BorderRadius.circular(10)),
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const CustomIconWidget(icon: AppIcons.toolLocation),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MediumText(
                                text: shopName,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.appYellow),
                              ),
                              Row(
                                children: [
                                  MediumText(
                                    text: rating,
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: CustomIconWidget(
                                        icon: AppIcons.singleStar),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatPage()));
                        },
                        icon:
                            const CustomIconWidget(icon: AppIcons.messageBlack),
                      ),
                      IconButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {},
                          icon: const CustomIconWidget(icon: AppIcons.phone))
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MediumText(
                        text: carName,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: MediumText(
                              text: AppText.black,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            ),
                          ),
                          MediumText(
                            text: number,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SubTitleTextWidget(text: AppText.price),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: CustomIconWidget(icon: AppImages.money),
                          ),
                          MediumText(
                            text: price,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(
                  color: AppColors.grey,
                  height: 1,
                  thickness: 2,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SubTitleTextWidget(text: AppText.distance),
                        MediumText(
                          text: distance,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SubTitleTextWidget(text: AppText.approximatelyIn),
                        MediumText(
                          text: approxTime,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SubTitleTextWidget(
                            text: AppText.estDestinationTime,
                            align: TextAlign.right),
                        MediumText(
                          text: estmateTime,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BatteryLocationScreen(
                                  title: title,
                                )));
                  },
                  child: const Text(AppText.cancel))
            ],
          ),
        ),
      ),
    );
  }
}
