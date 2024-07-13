import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:got_stuck/config/app_images.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/config/helpers/responsive.dart';
import 'package:got_stuck/screens/homeScreen/Screen3.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/CarDetail.dart';
import 'package:got_stuck/widgets/RoundedButton.dart';
import 'package:got_stuck/widgets/SubTitleTextWidget.dart';
import 'package:got_stuck/widgets/TitleTextWidget.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';
import 'package:got_stuck/screens/RecoveryModule/RadarScreen.dart';
// import 'package:got_stuck/widgets/roundedTextInput.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../config/app_icons.dart';
import '../../widgets/AppText/large_text.dart';
import '../batteryModule/BatteryLocationScreen.dart';

class RecoveryScreen2 extends StatefulWidget {
  const RecoveryScreen2({super.key});

  @override
  State<RecoveryScreen2> createState() => _RecoveryScreen2State();
}

class _RecoveryScreen2State extends State<RecoveryScreen2> {
  static const CameraPosition pos =
      CameraPosition(target: LatLng(51.534497, -0.034000), zoom: 14.4746);
  // TextEditingController controller1 =
  //     TextEditingController(text: AppText.pickLocation);
  // TextEditingController controller2 = TextEditingController();

  // double height = 200;
  // bool border1 = false;
  // bool border2 = false;
  // bool cross = false;
  final List<ShopData> data = [
    ShopData(
        icon: AppIcons.triangle,
        shopName: AppText.tahirBodyWorks,
        estimatedTime: '3 Miles, 15 min',
        rating: '4.9',
        price: '6.99',
        vehicleLocation: false,
        call: true,
        btnText: AppText.purchaseService),
    ShopData(
        icon: AppIcons.g,
        shopName: 'Adnan Chingchi Repairs',
        estimatedTime: '3 Miles, 15 min',
        rating: '4.9',
        price: '6.99',
        vehicleLocation: true,
        call: true,
        btnText: AppText.select),
    ShopData(
        icon: AppIcons.ad,
        shopName: AppText.saleemMechanic,
        estimatedTime: '3 Miles, 15 min',
        rating: '4.9',
        price: '6.99',
        vehicleLocation: false,
        call: false,
        btnText: AppText.select),
  ];

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   ShowBottomSheet(context);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.socialIcon,
      appBar: const CustomAppBar_CarDetailWidget(
          title: AppText.recovery,
          carDetailBuilder: CarDetail(
              carName: AppText.carName,
              carNumber: AppText.carNumber,
              countryName: 'UK')),
      //  AppBar(
      //     backgroundColor: AppColors.white,
      //     scrolledUnderElevation: 0,
      //     shape: const RoundedRectangleBorder(
      //         borderRadius: BorderRadius.only(
      //             bottomLeft: Radius.circular(20),
      //             bottomRight: Radius.circular(20))),
      //     // backgroundColor: AppColors.blue,
      //     automaticallyImplyLeading: false,
      //     centerTitle: true,
      //     // toolbarHeight: 145,
      //     //145
      //     leading: Padding(
      //       padding: const EdgeInsets.only(left: 10),
      //       child: IconButton(
      //           splashRadius: 1,
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
      //             countryName: 'UK'))
      //
      // Column(
      //   children: [
      //     Row(children: [
      //       //   IconButton(
      //       //       splashRadius: 20,
      //       //       onPressed: () {
      //       //         Navigator.pop(context);
      //       //       },
      //       //       icon: SvgPicture.asset(AppIcons.backArrow)),
      //       const Expanded(
      //         child: LargeText(
      //           text: AppText.recovery,
      //           style: TextStyle(
      //               fontFamily: 'Poppins',
      //               fontWeight: FontWeight.w600,
      //               fontSize: 24),
      //         ),
      //       )
      //     ]),
      //     // Container(
      //     //   color: Colors.orange,
      //     //   child: const CarDetail(
      //     //       // height: height <= 640
      //     //       //     ? screenHeight(context) / 7.8
      //     //       //     : screenHeight(context) / 8,
      //     //       // dotsLeftSpacing: screenWidth(context) / 2.4,
      //     //       // dotsBottomSpacing: height <= 640
      //     //       //     ? screenWidth(context) / 90
      //     //       //     : screenWidth(context) / 30,
      //     //       carName: AppText.carName,
      //     //       carNumber: AppText.carNumber,
      //     //       countryName: AppText.uk),
      //     // )
      //   ],
      // ),
      // ),
      body: SafeArea(
          child: Stack(
        children: [
          SizedBox(
              height: screenHeight(context) * 0.54,
              child: const GoogleMap(
                initialCameraPosition: pos,
                zoomControlsEnabled: false,
              )),
        ],
      )),
      bottomSheet: ModalBottomSheetWidget(shopData: data),
    );
  }
}

class ShopData {
  final String icon;
  final String shopName;
  final String estimatedTime;
  final String rating;
  final String price;
  final bool vehicleLocation;
  final bool call;
  final String btnText;

  ShopData(
      {required this.icon,
      required this.shopName,
      required this.estimatedTime,
      required this.rating,
      required this.price,
      required this.vehicleLocation,
      required this.call,
      required this.btnText});
}

// ignore: must_be_immutable
class ModalBottomSheetWidget extends StatelessWidget {
  ModalBottomSheetWidget({super.key, required this.shopData});
  final List<ShopData> shopData;

  TextEditingController controller1 =
      TextEditingController(text: AppText.pickLocation);
  TextEditingController controller2 = TextEditingController();

  double height = 200;
  bool border1 = false;
  bool border2 = false;
  bool cross = false;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          // duration: const Duration(milliseconds: 500),
          padding: const EdgeInsets.only(top: 10),
          height: height,
          decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(28), topLeft: Radius.circular(28))),
          child: Stack(
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomIconWidget(icon: AppIcons.blackHorizontalLine),
                  Stack(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 50, right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const MediumText(
                              text: AppText.vehicleLocation,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12),
                            ),
                            Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                      border: border1
                                          ? Border.all(
                                              color: AppColors.appYellow,
                                              width: 1)
                                          : null,
                                      color: AppColors.socialIcon,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: TextField(
                                      readOnly: true,
                                      onTap: () {
                                        setState(() {
                                          border1 = true;
                                          border2 = false;
                                        });
                                      },
                                      controller: controller1,
                                      keyboardType: TextInputType.streetAddress,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20))),
                                ),
                                height <= 200
                                    ? const Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: CustomIconWidget(
                                            icon: AppIcons.crossBox),
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: MediumText(
                                text: AppText.dropOffLocation,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ),
                            Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                      border: border2
                                          ? Border.all(
                                              color: AppColors.appYellow,
                                              width: 1)
                                          : null,
                                      color: AppColors.socialIcon,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: TextField(
                                      readOnly: true,
                                      onTap: () {
                                        setState(() {
                                          if (height <= 200) {
                                            height =
                                                screenHeight(context) * 0.6;
                                          }
                                          border1 = false;
                                          border2 = true;
                                        });
                                      },
                                      controller: controller2,
                                      keyboardType: TextInputType.streetAddress,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20))),
                                ),
                                height > 200
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              cross = !cross;
                                            });
                                          },
                                          child: const CustomIconWidget(
                                              icon: AppIcons.crossBox),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            height > 200
                                ? const CustomIconWidget(
                                    icon: AppIcons.vehicleLocation)
                                : Container(),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 14, top: height <= 200 ? 40 : 0),
                              child: const CustomIconWidget(
                                icon: AppIcons.dottedLine,
                                height: 50,
                              ),
                            ),
                            const CustomIconWidget(
                                icon: AppIcons.dropofflocation)
                          ],
                        ),
                      )
                    ],
                  ),
                  height > 200 && height != 400
                      ? Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 30, top: 10),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: shopData.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      controller2 = TextEditingController(
                                          text: shopData[index].shopName);
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: AppColors.socialIcon,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Stack(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  CustomIconWidget(
                                                      icon:
                                                          shopData[index].icon),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: LargeText(
                                                        text: shopData[index]
                                                            .shopName,
                                                        style: const TextStyle(
                                                            fontFamily: 'Inter',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 35),
                                                child: Row(
                                                  children: [
                                                    const SubTitleTextWidget(
                                                      text: AppText.estimated,
                                                      style: TextStyle(
                                                          fontFamily: 'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12,
                                                          color:
                                                              AppColors.grey),
                                                    ),
                                                    Expanded(
                                                      child: SubTitleTextWidget(
                                                        text: shopData[index]
                                                            .estimatedTime,
                                                        style: const TextStyle(
                                                            fontFamily: 'Inter',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12,
                                                            color:
                                                                AppColors.grey),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 35,
                                                    right: 10,
                                                    top: 10),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment: cross ==
                                                          false
                                                      ? MainAxisAlignment
                                                          .spaceBetween
                                                      : MainAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const SubTitleTextWidget(
                                                          text: AppText.rating,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 12,
                                                              color: AppColors
                                                                  .grey),
                                                        ),
                                                        Row(
                                                          children: [
                                                            TitleTextWidget(
                                                                text: shopData[
                                                                        index]
                                                                    .rating),
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 5),
                                                              child: CustomIconWidget(
                                                                  icon: AppIcons
                                                                      .singleStar),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: cross ? 15 : 0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const SubTitleTextWidget(
                                                            text: AppText.price,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12,
                                                                color: AppColors
                                                                    .grey),
                                                          ),
                                                          Row(
                                                            children: [
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            5),
                                                                child: CustomIconWidget(
                                                                    icon: AppImages
                                                                        .money),
                                                              ),
                                                              TitleTextWidget(
                                                                  text: shopData[
                                                                          index]
                                                                      .price),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          cross
                                              ? Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        shopData[index].call
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            10),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {},
                                                                  child: const CustomIconWidget(
                                                                      icon: AppIcons
                                                                          .callYlw),
                                                                ),
                                                              )
                                                            : Container(),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              top: shopData[
                                                                          index]
                                                                      .call
                                                                  ? 10
                                                                  : 30),
                                                          child: TextButton(
                                                              style: TextButton.styleFrom(
                                                                  fixedSize:
                                                                      const Size(
                                                                          125, 27),
                                                                  backgroundColor:
                                                                      AppColors
                                                                          .black,
                                                                  foregroundColor:
                                                                      AppColors
                                                                          .white,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10))),
                                                              onPressed: () {},
                                                              child: MediumText(
                                                                text: shopData[
                                                                        index]
                                                                    .btnText,
                                                                style: const TextStyle(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12),
                                                              )),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                          cross == true &&
                                                  shopData[index]
                                                      .vehicleLocation
                                              ? const Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 40),
                                                  child: CustomIconWidget(
                                                      icon: AppIcons
                                                          .vehicleLocation),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : Container(),
                  height > 200 && height != 400
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: RoundedButton(
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white),
                              text: AppText.next,
                              onTap: () {
                                setState(() {
                                  height = 400;
                                });
                              },
                              txtColor: AppColors.white,
                              backgroundColor: AppColors.black),
                        )
                      : Container(),
                  height == 400
                      ? Padding(
                          padding: const EdgeInsets.only(top: 90),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: AppColors.socialIcon,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Screen3(
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
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0),
                                                child: CustomIconWidget(
                                                    icon: AppIcons.number),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 0),
                                                child: CustomIconWidget(
                                                    icon: AppIcons.next),
                                              )
                                            ],
                                          ),
                                        )
                                      ]),
                                    )),
                              ),
                              RoundedButton(
                                  text: AppText.confirmBooking,
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RadarScreen()));
                                  },
                                  txtColor: AppColors.white,
                                  backgroundColor: AppColors.black)
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
