import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:got_stuck/config/app_images.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/screens/CarWashModule/CarWashQRScreen.dart';
import 'package:got_stuck/screens/homeScreen/Screen3.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/CarDetail.dart';
import 'package:got_stuck/widgets/RoundedButton.dart';
import 'package:got_stuck/widgets/SubTitleTextWidget.dart';
import 'package:got_stuck/widgets/TitleTextWidget.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';
import '../../config/app_icons.dart';
// import '../../widgets/AppText/large_text.dart';
import '../CarWashModule/CarWashMainScreen.dart';
import '../batteryModule/BatteryLocationScreen.dart';

class SingleCarDetailScreen extends StatefulWidget {
  const SingleCarDetailScreen({super.key});

  @override
  State<SingleCarDetailScreen> createState() => _SingleCarDetailScreenState();
}

class _SingleCarDetailScreenState extends State<SingleCarDetailScreen> {
  final List<String> data = [
    AppText.operationOfExternal,
    AppText.operationOfInstrument,
    AppText.checkHorn,
    AppText.checkWindscreen,
    AppText.topUpWind,
    AppText.drainEngine,
    AppText.replaceOil,
    AppText.refillWith
  ];
  bool helpful = false;
  bool helpful2 = false;
  int count = 0;
  static const CameraPosition pos =
      CameraPosition(target: LatLng(51.534497, -0.034000), zoom: 14.4746);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        appBar: const CustomAppBar_CarDetailWidget(
            title: AppText.carWash,
            carDetailBuilder: CarDetail(
                carName: AppText.carName,
                carNumber: AppText.carNumber,
                countryName: 'UK')),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                        child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                // color: Colors.orange,
                                borderRadius: BorderRadius.circular(11)),
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(11),
                                  child: const CustomIconWidget(
                                    icon: AppImages.car,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: MediumText(
                                            text: '4.5',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: AppColors.white,
                                                fontFamily: 'Open Sans'),
                                          )),
                                      CustomRatingWidget(
                                          rating: 4.5,
                                          selectedColor: AppColors.appYellow,
                                          unselectedColor: AppColors.white,
                                          onChanged: (value) {}),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 5),
                              child: Row(children: [
                                Expanded(
                                    child: TitleTextWidget(
                                        text: AppText.tahirBodyWorks)),
                                TitleTextWidget(text: '£ 5.99'),
                              ])),
                          const Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: CustomIconWidget(
                                      icon: AppIcons.location)),
                              Expanded(
                                  child: SubTitleTextWidget(
                                text: AppText.londonAddress,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: AppColors.darkGrey),
                              ))
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10, top: 3),
                            child: SubTitleTextWidget(
                              text: '3 Miles, 15 min',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: AppColors.darkGrey),
                            ),
                          ),
                          const TitleTextWidget(text: AppText.serviceInclude),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: data
                                  .map((e) => Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 5, bottom: 5, right: 20),
                                            child: CustomIconWidget(
                                                icon: AppIcons.dot),
                                          ),
                                          Flexible(
                                            child: SubTitleTextWidget(
                                              text: e,
                                              style: const TextStyle(
                                                  fontFamily: 'Open Sans',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: AppColors.darkGrey),
                                            ),
                                          ),
                                        ],
                                      ))
                                  .toList(),
                            ),
                          ),
                          const TitleTextWidget(text: AppText.aboutCompany),
                          const SubTitleTextWidget(
                            text: AppText.aboutCompanyPara,
                            style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.darkGrey),
                            align: TextAlign.justify,
                          ),
                          Container(
                            height: 200,
                            // padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                // color: Colors.orange,
                                border: Border.all(
                                    color: AppColors.white, width: 5),
                                borderRadius: BorderRadius.circular(11)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: GoogleMap(
                                initialCameraPosition: pos,
                                zoomControlsEnabled: false,
                                padding: const EdgeInsets.all(11),
                                gestureRecognizers: Set(),
                                scrollGesturesEnabled: false,
                                zoomGesturesEnabled: false,
                                tiltGesturesEnabled: false,
                                rotateGesturesEnabled: false,
                              ),
                            ),
                            // child: ClipRRect(
                            //     borderRadius: BorderRadius.circular(11),
                            //     child: const CustomIconWidget(
                            //         icon: 'assets/images/map.png')),
                          ),
                          const TitleTextWidget(text: 'London - 11.6 mi'),
                          const SubTitleTextWidget(
                              text: AppText.londonAddress,
                              style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: AppColors.darkGrey)),
                          Row(
                            children: [
                              const CustomIconWidget(
                                icon: AppIcons.website,
                                // height: 200,s
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {},
                                  child: const Text(AppText.website))
                            ],
                          ),
                          const TitleTextWidget(text: AppText.aboutOwner),
                          const SubTitleTextWidget(
                            text: AppText.aboutCompanyPara,
                            style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.darkGrey),
                            align: TextAlign.justify,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SubTitleTextWidget(
                                    text: AppText.sortBy,
                                    style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12)),
                                OutlinedButton(
                                    style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                    onPressed: () {},
                                    child: const MediumText(
                                      text: AppText.highestRated,
                                      style: TextStyle(
                                          fontFamily: 'Open Sans',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.black),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.socialIcon,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: AppText.writeYourMessageQuery,
                                    hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10)),
                                maxLines: 5,
                              ),
                            ),
                          ),
                          FilledButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: AppColors.appYellow,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {},
                              child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 15),
                                  child: Text(
                                    AppText.send,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  ))),
                          UserReviewWidget(
                              isHelpful: helpful,
                              onTap: () {
                                setState(() {
                                  helpful = !helpful;
                                });
                              }),
                          UserReviewWidget(
                              isHelpful: helpful2,
                              onTap: () {
                                setState(() {
                                  helpful2 = !helpful2;
                                });
                              }),
                        ],
                      ),
                    )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RoundedButton(
                      text: AppText.buyNow,
                      onTap: () {
                        showModalBottomSheet(
                          elevation: 10,
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 1),
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (context, setState) {
                              return Container(
                                height: 373,
                                decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 21,
                                          spreadRadius: 6,
                                          offset: Offset(0, 4),
                                          color: Color.fromRGBO(0, 0, 0, 0.11))
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 20, right: 20),
                                  child: Column(
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 10, right: 10),
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  243, 246, 248, 1),
                                              // color: Color.fromRGBO(
                                              //     243, 246, 248, 1),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TitleTextWidget(
                                                        text: AppText
                                                            .tahirBodyWorks),
                                                    TitleTextWidget(
                                                        text: '£ 5.99'),
                                                  ]),
                                              const SubTitleTextWidget(
                                                text: '3 Miles, 15 min',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: AppColors.darkGrey),
                                              ),
                                              CustomRatingWidget(
                                                  rating: 5,
                                                  selectedColor:
                                                      AppColors.appYellow,
                                                  unselectedColor:
                                                      AppColors.white,
                                                  onChanged: (value) {}),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5),
                                                    child: Container(
                                                        padding: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 10,
                                                            vertical: 5),
                                                        decoration: BoxDecoration(
                                                            color: const Color
                                                                    .fromRGBO(
                                                                226, 230, 233, 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3)),
                                                        child: const SubTitleTextWidget(
                                                            text: AppText
                                                                .softTouch)),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                        padding: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 10,
                                                            vertical: 5),
                                                        decoration: BoxDecoration(
                                                            color: const Color
                                                                    .fromRGBO(
                                                                226, 230, 233, 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3)),
                                                        child: const SubTitleTextWidget(
                                                            text: AppText
                                                                .exteriorWash)),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10, bottom: 5),
                                                child: Row(
                                                  children: [
                                                    const TitleTextWidget(
                                                        text: AppText.voucher),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20),
                                                      child: Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(
                                                                () {
                                                                  if (count ==
                                                                      0) {
                                                                    count = 0;
                                                                  } else {
                                                                    count--;
                                                                  }
                                                                },
                                                              );
                                                            },
                                                            child:
                                                                const CustomIconWidget(
                                                                    icon: AppIcons
                                                                        .minus),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            child: MediumText(
                                                              text: count
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 20),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(
                                                                () {
                                                                  count++;
                                                                },
                                                              );
                                                            },
                                                            child:
                                                                const CustomIconWidget(
                                                                    icon: AppIcons
                                                                        .plus),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: TextButton(
                                            style: TextButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.socialIcon,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Screen3(
                                                              isBack: true)));
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 20),
                                              child: Row(children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 20),
                                                  child: CustomIconWidget(
                                                    icon: AppImages.applePay,
                                                    height: 20,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 0),
                                                        child: CustomIconWidget(
                                                            icon: AppIcons
                                                                .number),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 0),
                                                        child: CustomIconWidget(
                                                            icon:
                                                                AppIcons.next),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                            )),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: RoundedButton(
                                                text: AppText.buyNow,
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const CarWashQRScreen()));
                                                },
                                                txtColor: AppColors.white,
                                                backgroundColor:
                                                    AppColors.black),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                          },
                        );
                      },
                      txtColor: AppColors.white,
                      backgroundColor: AppColors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UserReviewWidget extends StatelessWidget {
  const UserReviewWidget(
      {super.key, required this.onTap, required this.isHelpful});

  final VoidCallback onTap;
  final bool isHelpful;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          color: AppColors.dotColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                          child: TitleTextWidget(
                        text: AppText.g,
                        style: TextStyle(
                            fontFamily: 'Open Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleTextWidget(text: AppText.gillian),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.star_border,
                                size: 14,
                              ),
                            ),
                            Text(AppText.sixRating),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(
                                Icons.chat_bubble_outline,
                                size: 14,
                              ),
                            ),
                            Text(AppText.threeReviews)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 5),
                    child: CustomRatingWidget(
                        rating: 5,
                        selectedColor: AppColors.appYellow,
                        size: 15,
                        unselectedColor: AppColors.white,
                        onChanged: (value) {}),
                  ),
                  const Text('March 1, 2023')
                ],
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: SubTitleTextWidget(
            text: AppText.whatAGreatServicePara,
            style: TextStyle(
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.darkGrey),
            align: TextAlign.justify,
          ),
        ),
        OutlinedButton.icon(
            style: TextButton.styleFrom(
                foregroundColor: AppColors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: onTap,
            icon: isHelpful == true
                ? const CustomIconWidget(
                    icon: AppIcons.likeFillBlack,
                    height: 20,
                  )
                : const CustomIconWidget(
                    icon: AppIcons.likeemptyBlack,
                    height: 20,
                  ),
            label: const Text(AppText.helpful)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.socialIcon,
                borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                      text: AppText.denizAuto,
                      style: TextStyle(
                          fontFamily: 'Open Sans,',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: AppColors.black),
                      children: [
                        TextSpan(
                          text: AppText.replied,
                          style: TextStyle(
                              fontFamily: 'Open Sans,',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.black),
                        )
                      ]),
                ),
                const MediumText(
                  text: AppText.view,
                  style: TextStyle(
                      fontFamily: 'Open Sans,',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColors.black),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                    color: AppColors.dotColor,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                    child: TitleTextWidget(
                  text: AppText.g,
                  style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                )),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: SubTitleTextWidget(
                  text: AppText.thankyou,
                  style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
