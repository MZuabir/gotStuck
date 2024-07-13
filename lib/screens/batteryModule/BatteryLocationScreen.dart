// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:got_stuck/config/app_images.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/screens/batteryModule/BatteryRadarScreen.dart';
import 'package:got_stuck/screens/homeScreen/Screen3.dart';

import '../../config/app_icons.dart';
import '../../config/colors.dart';
import '../../config/helpers/responsive.dart';
import '../../widgets/AppText/large_text.dart';
import '../../widgets/AppText/medium_text.dart';
import '../../widgets/CarDetail.dart';
import '../../widgets/RoundedButton.dart';
import '../../widgets/customIconWidget.dart';

class BatteryLocationScreen extends StatefulWidget {
  const BatteryLocationScreen(
      {super.key, required this.title, this.paddingRight});
  final String title;
  final double? paddingRight;

  @override
  State<BatteryLocationScreen> createState() => _BatteryLocationScreenState();
}

class _BatteryLocationScreenState extends State<BatteryLocationScreen> {
  static const CameraPosition pos =
      CameraPosition(target: LatLng(51.534497, -0.034000), zoom: 14.4746);

  @override
  void initState() {
    super.initState();
  }

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
      body: SizedBox(
          height: screenHeight(context) * 0.53,
          child: const GoogleMap(
            initialCameraPosition: pos,
            zoomControlsEnabled: false,
          )),
      bottomSheet: ModalBottomSheetBattery(title: widget.title),
    );
  }
}

class CustomAppBar_CarDetailWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBar_CarDetailWidget({
    super.key,
    required this.carDetailBuilder,
    required this.title,
  });
  final String title;
  final Widget carDetailBuilder;
  Size get preferredSize => const Size.fromHeight(150);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        scrolledUnderElevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        // toolbarHeight: 145,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: FittedBox(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(AppIcons.backArrow)),
          ),
        ),
        title: LargeText(
          text: title,
          style: const TextStyle(
              fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 24),
        ),
        bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 100),
            child: CarDetail(
                carName: AppText.carName,
                carNumber: AppText.carNumber,
                countryName: 'UK'))
        // Column(
        //   children: [
        //     Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        //       IconButton(
        //           splashRadius: 20,
        //           onPressed: () {
        //             Navigator.pop(context);
        //           },
        //           icon: SvgPicture.asset(AppIcons.backArrow)),
        //       Expanded(
        //         child: Center(
        //           child: Padding(
        //               padding: const EdgeInsets.only(right: 40),
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
        );
  }
}

// ignore: must_be_immutable
class ModalBottomSheetBattery extends StatelessWidget {
  ModalBottomSheetBattery({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  TextEditingController controller1 =
      TextEditingController(text: AppText.pickLocation);
  TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            // duration: const Duration(milliseconds: 500),
            padding: const EdgeInsets.only(top: 10),
            height: 405,
            decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(28),
                    topLeft: Radius.circular(28))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: CustomIconWidget(
                            icon: AppIcons.blackHorizontalLine)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 35),
                          child: MediumText(
                            text: AppText.vehicleLocation,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
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
                                      color: AppColors.socialIcon,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Stack(
                                    alignment: Alignment.centerRight,
                                    children: [
                                      TextField(
                                          readOnly: true,
                                          onTap: () {},
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
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 20,
                                  spreadRadius: 6,
                                  color: Color.fromRGBO(0, 0, 0, 0.06))
                            ]),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomIconWidget(icon: AppIcons.toolLocation),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            MediumText(
                                              text: AppText.distance,
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      96, 100, 112, 1)),
                                            ),
                                            Row(
                                              children: [
                                                LargeText(
                                                  text: '4.2',
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 5),
                                                  child: MediumText(
                                                    text: 'mi',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            MediumText(
                                              text: AppText.estPrice,
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      96, 100, 112, 1)),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(right: 5),
                                                  child: CustomIconWidget(
                                                      icon: AppImages.money),
                                                ),
                                                LargeText(
                                                  text: '5.99',
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              color: Color.fromRGBO(151, 151, 151, 1),
                              thickness: 1,
                            ),
                            MediumText(
                              text: AppText.estPrice,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(96, 100, 112, 1)),
                            ),
                            Row(
                              children: [
                                LargeText(
                                  text: '4:00',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: MediumText(
                                    text: 'min',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 0, right: 0, bottom: 10),
                      child: Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 20,
                              spreadRadius: 6,
                              color: Color.fromRGBO(0, 0, 0, 0.06))
                        ]),
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Screen3(
                                            isBack: true,
                                          )));
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Row(children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: CustomIconWidget(
                                    icon: AppImages.applePay,
                                    height: 20,
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 0),
                                        child: CustomIconWidget(
                                            icon: AppIcons.number),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 0),
                                        child: CustomIconWidget(
                                            icon: AppIcons.next),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            )),
                      ),
                    ),
                    RoundedButton(
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
                                      BatteryRadarScreen(title: title)));
                        },
                        txtColor: AppColors.white,
                        backgroundColor: AppColors.black)
                  ]),
            ),
          ),
        ),
      );
    });
  }
}
