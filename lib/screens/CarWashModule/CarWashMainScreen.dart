// import 'dart:developer'
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/config/helpers/responsive.dart';
import 'package:got_stuck/dataModels/ShopDetailModel.dart';
// import 'package:got_stuck/widgets/AppText/CustomLikeButton.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/CarDetail.dart';
import 'package:got_stuck/widgets/SubTitleTextWidget.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import '../../config/app_icons.dart';
// import '../../config/app_text.dart';
// import '../../widgets/AppText/large_text.dart';
import '../../widgets/RoundedButton.dart';
import '../../widgets/TitleTextWidget.dart';
import '../PetrolPumpModule/PetrolPumpListScreen.dart';
import '../batteryModule/BatteryLocationScreen.dart';
import 'SingleCarDetailScreen.dart';

class CarWashMainScreen extends StatefulWidget {
  const CarWashMainScreen({super.key});

  @override
  State<CarWashMainScreen> createState() => _CarWashMainScreenState();
}

class _CarWashMainScreenState extends State<CarWashMainScreen> {
  final List<ShopDetail> shopData = [
    ShopDetail(
        shopName: AppText.tahirBodyWorks,
        distance: '3 Miles, 15 min',
        amount: '£ 5.99',
        services: ['Automatic Wash', 'Labor'],
        rating: 3.5,
        isFeatured: true),
    ShopDetail(
        shopName: AppText.saleemMechanic,
        distance: '3 Miles, 15 min',
        amount: '£ 5.99',
        services: ['Foam Wash', 'Shiner', 'Labor'],
        rating: 5.0,
        isFeatured: false),
    ShopDetail(
        shopName: AppText.tahirBodyWorks,
        distance: '3 Miles, 15 min',
        amount: '£ 5.99',
        services: [
          AppText.foamWash,
          AppText.shiner,
          AppText.labor,
          AppText.labor,
          AppText.labor,
          AppText.labor,
        ],
        rating: 2.1,
        isFeatured: true),
    ShopDetail(
        shopName: AppText.saleemMechanic,
        distance: '3 Miles, 15 min',
        amount: '£ 5.99',
        services: [
          AppText.foamWash,
          AppText.shiner,
          AppText.labor,
          AppText.labor,
          AppText.labor,
          AppText.labor,
        ],
        rating: 2.1,
        isFeatured: true),
  ];
  double startVal = 10;
  double endVal = 400;
  double minVal = 0;
  double maxVal = 500;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar_CarDetailWidget(
          title: AppText.carWash,
          carDetailBuilder: CarDetail(
              carName: AppText.carName,
              carNumber: AppText.carNumber,
              countryName: 'UK')),
      body: SafeArea(
        child: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const MediumText(
                            text: AppText.filterShopsby,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                          Row(children: [
                            CustomIconButton(
                                height: 40,
                                icon: 'assets/images/search.png',
                                onTap: () {
                                  Fluttertoast.showToast(msg: 'Coming soon');
                                }),
                            CustomIconButton(
                                onTap: () {
                                  showModalBottomSheet(
                                    elevation: 10,
                                    barrierColor: Colors.transparent,
                                    backgroundColor: AppColors.white,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(
                                        builder: (context, setState) {
                                          return Container(
                                            decoration: const BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 19,
                                                      spreadRadius: 2,
                                                      offset: Offset(0, 4),
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.14))
                                                ],
                                                color: AppColors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20))),
                                            height: 470,
                                            child: Stack(children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 30),
                                                      child: TitleTextWidget(
                                                          text: AppText
                                                              .serviceCategories),
                                                    ),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              10),
                                                                  child:
                                                                      BottomSheetButtonWidget(
                                                                    text: AppText
                                                                        .exteriorWash,
                                                                  )),
                                                              BottomSheetButtonWidget(
                                                                  text: AppText
                                                                      .interiorWash)
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              10),
                                                                  child:
                                                                      BottomSheetButtonWidget(
                                                                    text: AppText
                                                                        .fullWash,
                                                                  )),
                                                              BottomSheetButtonWidget(
                                                                  text: AppText
                                                                      .fullServiceHand)
                                                            ],
                                                          ),
                                                          BottomSheetButtonWidget(
                                                              text: AppText
                                                                  .automatedFullService),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          right:
                                                                              10),
                                                                  child:
                                                                      BottomSheetButtonWidget(
                                                                    text: AppText
                                                                        .tireShine,
                                                                  )),
                                                              BottomSheetButtonWidget(
                                                                  text: AppText
                                                                      .hotWax)
                                                            ],
                                                          ),
                                                          BottomSheetButtonWidget(
                                                              text: AppText
                                                                  .softTouch),
                                                        ],
                                                      ),
                                                    ),
                                                    const TitleTextWidget(
                                                        text:
                                                            AppText.priceRange),
                                                    RangeSlider(
                                                      max: maxVal,
                                                      min: minVal,
                                                      activeColor:
                                                          const Color.fromRGBO(
                                                              244, 183, 51, 1),
                                                      values: RangeValues(
                                                          startVal, endVal),
                                                      onChanged: (RangeValues
                                                          newValues) {
                                                        setState(() {
                                                          startVal = newValues
                                                              .start
                                                              .toDouble();
                                                          endVal = newValues.end
                                                              .toDouble();
                                                        });
                                                      },
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          bottom: 10),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: MediumText(
                                                            text:
                                                                '${(endVal - startVal).toInt()} \$'),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 10),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: RoundedButton(
                                                              style: const TextStyle(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: AppColors
                                                                      .white),
                                                              text: AppText
                                                                  .confirm,
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                const SingleCarDetailScreen()));
                                                              },
                                                              txtColor:
                                                                  AppColors
                                                                      .white,
                                                              backgroundColor:
                                                                  AppColors
                                                                      .black),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                right: 5,
                                                child: TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child:
                                                        const SubTitleTextWidget(
                                                            text:
                                                                AppText.close)),
                                              )
                                            ]),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                                color: AppColors.socialIcon,
                                icon: AppIcons.filter),
                          ])
                        ])),
                Expanded(
                  child: CustomShopsDetailListBuilderWidget(shopData: shopData),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomShopsDetailListBuilderWidget extends StatelessWidget {
  const CustomShopsDetailListBuilderWidget({
    super.key,
    required this.shopData,
  });

  final List<ShopDetail> shopData;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 20),
        itemCount: shopData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 10, top: 20),
                  decoration: BoxDecoration(
                      color: AppColors.socialIcon,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: MediumText(
                                text: shopData[index].shopName,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            MediumText(
                              text: shopData[index].amount,
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20),
                              align: TextAlign.right,
                            )
                          ]),
                      SubTitleTextWidget(text: shopData[index].distance),
                      CustomRatingWidget(
                        rating: shopData[index].rating,
                        onChanged: (value) {},
                        selectedColor: AppColors.appYellow,
                        unselectedColor: AppColors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Wrap(
                            children: shopData[index]
                                .services
                                .map((service) => Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5, bottom: 5),
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  226, 230, 233, 1),
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: SubTitleTextWidget(
                                              text: service)),
                                    ))
                                .toList()),
                      )
                    ],
                  ),
                ),
                shopData[index].isFeatured == true
                    ? const CustomIconWidget(icon: AppIcons.featured)
                    : const Text(''),
                shopData[index].isFeatured == true
                    ? const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                        child: SubTitleTextWidget(
                            text: AppText.featured,
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                color: AppColors.white)))
                    : const Text(''),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomShopDetailTileWidget extends StatelessWidget {
  const CustomShopDetailTileWidget({
    super.key,
    required this.rating,
    required this.shopName,
    required this.amount,
    required this.distance,
    required this.serviceName1,
    required this.serviceName2,
    required this.onChange,
  });

  final double rating;
  final String shopName;
  final String amount;
  final String distance;
  final String serviceName1;
  final String serviceName2;
  final ValueChanged<double> onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 20),
            decoration: BoxDecoration(
                color: AppColors.socialIcon,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MediumText(
                        text: shopName,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      MediumText(
                        text: amount,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                        align: TextAlign.right,
                      )
                    ]),
                SubTitleTextWidget(text: distance),
                CustomRatingWidget(
                  rating: rating,
                  onChanged: onChange,
                  selectedColor: AppColors.appYellow,
                  unselectedColor: AppColors.white,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(226, 230, 233, 1),
                              borderRadius: BorderRadius.circular(3)),
                          child: SubTitleTextWidget(text: serviceName1)),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(226, 230, 233, 1),
                                borderRadius: BorderRadius.circular(3)),
                            child: SubTitleTextWidget(text: serviceName2)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const CustomIconWidget(icon: AppIcons.featured),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              child: SubTitleTextWidget(
                text: AppText.featured,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: AppColors.white),
              ))
        ],
      ),
    );
  }
}

class CustomRatingWidget extends StatelessWidget {
  const CustomRatingWidget({
    super.key,
    required this.rating,
    required this.selectedColor,
    required this.unselectedColor,
    required this.onChanged,
    this.size,
  });
  final double? size;
  final double rating;
  final Color selectedColor;
  final Color unselectedColor;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return PannableRatingBar(
      rate: rating,
      items: List.generate(
          5,
          (index) => RatingWidget(
                selectedColor: selectedColor,
                unSelectedColor: unselectedColor,
                child: Icon(
                  Icons.star,
                  size: size ?? 20,
                ),
              )),
      onChanged: onChanged,
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.color,
    required this.icon,
    required this.onTap,
    this.height,
  });
  final Color? color;
  final String icon;
  final VoidCallback onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: color ?? AppColors.socialIcon,
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        height: height,
        child: CustomIconWidget(icon: icon),
      ),
    );
  }
}
