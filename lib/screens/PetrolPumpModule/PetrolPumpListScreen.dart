import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:got_stuck/config/app_icons.dart';
import 'package:got_stuck/config/app_images.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/config/helpers/responsive.dart';
import 'package:got_stuck/dataModels/petrolPumpData.dart';
// import 'package:got_stuck/screens/CarWashScreens/CarWashMainScreen.dart';
import 'package:got_stuck/widgets/AppText/large_text.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/RoundedButton.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';
import '../../config/app_text.dart';
import '../../widgets/SubTitleTextWidget.dart';
import '../../widgets/TitleTextWidget.dart';

import 'SinglePetrolPumpScreen.dart';

class PetrolPumpListScreen extends StatefulWidget {
  const PetrolPumpListScreen({super.key});

  @override
  State<PetrolPumpListScreen> createState() => _PetrolPumpListScreenState();
}

class _PetrolPumpListScreenState extends State<PetrolPumpListScreen> {
  bool isPressed = false;
  double values = 200;
  List<PetrolPumpData> pumpData = [
    PetrolPumpData(
        title: 'Petrol Pump',
        subTitle: 'Estimated: 3 Miles, 15 min',
        likes: '10',
        disLike: '2',
        priceTitle: AppText.price,
        price: '149.7p',
        timesAgo: '4 days ago',
        image: AppImages.pump1),
    PetrolPumpData(
        title: 'Petrol Pump',
        subTitle: 'Estimated: 3 Miles, 15 min',
        likes: '10',
        disLike: '2',
        priceTitle: 'Price',
        price: '149.7p',
        timesAgo: '4 days ago',
        image: AppImages.pump2),
    PetrolPumpData(
        title: 'Petrol Pump',
        subTitle: 'Estimated: 3 Miles, 15 min',
        likes: '10',
        disLike: '2',
        priceTitle: 'Price',
        price: '149.7p',
        timesAgo: '4 days ago',
        image: AppImages.pump3),
    PetrolPumpData(
        title: 'Petrol Pump',
        subTitle: 'Estimated: 3 Miles, 15 min',
        likes: '10',
        disLike: '2',
        priceTitle: 'Price',
        price: '149.7p',
        timesAgo: '4 days ago',
        image: AppImages.pump4),
  ];
  double min = 0;
  double max = 500;
  double exmin = 10;
  double exmax = 400;
  @override
  Widget build(BuildContext context) {
    print(isPressed);
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SizedBox(
            height: screenHeight(context) - kBottomNavigationBarHeight,
            width: screenWidth(context),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 60, left: 10, right: 20, bottom: 10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Transform.translate(
                            offset: const Offset(0, -10),
                            child: IconButton(
                                splashRadius: 20,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const CustomIconWidget(
                                    icon: AppIcons.backArrow)),
                          )),
                      const Expanded(
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LargeText(
                                    text: AppText.petrolPumpStationAndPrices,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins'),
                                  ),
                                  MediumText(
                                    text: AppText.nearestShopNearYou,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              )))
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LargeText(
                      text: AppText.filterPetrolAgency,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                    IconButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        icon: const CustomIconWidget(icon: AppIcons.filter),
                        onPressed: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return SizedBox(
                                    height: 327,
                                    child: Stack(children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 25),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const TitleTextWidget(
                                                text:
                                                    AppText.filterPetrolPumpBy),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      // width: 110,
                                                      // height: 50,
                                                      child: const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 10),
                                                          child:
                                                              BottomSheetButtonWidget(
                                                            text:
                                                                AppText.nearest,
                                                          ))),
                                                  const BottomSheetButtonWidget(
                                                      text: AppText.cheapest)
                                                ],
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              child: MediumText(
                                                text: AppText.searchingRange,
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15),
                                              ),
                                            ),
                                            SizedBox(
                                              // color: Colors.yellow,

                                              width: double.infinity,
                                              child: RangeSlider(
                                                max: max,
                                                min: min,
                                                activeColor:
                                                    const Color.fromRGBO(
                                                        244, 183, 51, 1),
                                                values:
                                                    RangeValues(exmin, exmax),
                                                // RangeValues(value, value + 500 values: ),

                                                onChanged:
                                                    (RangeValues newValues) {
                                                  setState(() {
                                                    exmin = newValues.start;
                                                    exmax = newValues.end;
                                                  });
                                                },
                                              ),
                                            ),
                                            Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: MediumText(
                                                  text:
                                                      '${(exmax - exmin).toInt()} mile',
                                                  style: const TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: RoundedButton(
                                                    style: const TextStyle(
                                                        fontFamily: 'Inter',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors.white),
                                                    text: AppText.confirm,
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    txtColor: AppColors.white,
                                                    backgroundColor:
                                                        AppColors.black),
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
                                            child: const SubTitleTextWidget(
                                                text: AppText.close)),
                                      )
                                    ]),
                                  );
                                },
                              );
                            },
                          );
                        }),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  // itemExtent: 50,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: pumpData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SinglePetrolPumpScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 7),
                        child: Container(
                          // padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),

                          // height: 95,
                          // width: 359,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.white,
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 38,
                                    spreadRadius: 25,
                                    color: Color.fromRGBO(0, 0, 0, 0.04))
                              ]),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    pumpData[index].image,
                                    height: 90,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TitleTextWidget(
                                          text: pumpData[index].title,
                                          style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.black),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: SubTitleTextWidget(
                                              text: pumpData[index].subTitle),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset(AppIcons.like),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Text(
                                                    pumpData[index].likes)),
                                            SvgPicture.asset(AppIcons.dislike),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child:
                                                  Text(pumpData[index].disLike),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                right: 0,
                                top: 15,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SubTitleTextWidget(
                                          text: pumpData[index].priceTitle),
                                      TitleTextWidget(
                                        text: pumpData[index].price,
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.black),
                                      ),
                                      SubTitleTextWidget(
                                          text: pumpData[index].timesAgo)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ])));
  }
}

class BottomSheetButtonWidget extends StatefulWidget {
  const BottomSheetButtonWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  State<BottomSheetButtonWidget> createState() =>
      _BottomSheetButtonWidgetState();
}

class _BottomSheetButtonWidgetState extends State<BottomSheetButtonWidget> {
  late bool isPressed;
  @override
  void initState() {
    isPressed = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: isPressed
                ? const Color.fromRGBO(244, 183, 51, 1)
                : const Color.fromRGBO(226, 230, 233, 1)),
        onPressed: () {
          setState(() {
            isPressed = !isPressed;
          });
        },
        child: MediumText(
          text: widget.text,
          style: TextStyle(
              color: isPressed
                  ? AppColors.white
                  : const Color.fromRGBO(130, 158, 170, 1)),
        ));
  }
}
