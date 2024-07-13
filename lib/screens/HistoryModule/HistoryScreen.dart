import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/SubTitleTextWidget.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';

import '../../config/app_icons.dart';
import '../../config/app_text.dart';
import '../../widgets/CustomNumberPlateDetailWidget.dart';
import '../../widgets/CustomTitleAppBar.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<HistoryData> data = [
    HistoryData(
        contHeight: 135,
        carNumber: AppText.carNumber,
        country: 'UK',
        date: '20-june-2023',
        service: AppText.recovery,
        serviceNumber: '123456789',
        vehicleLocation: AppText.pickLocation,
        dropOffLocation: AppText.dropOffLocation,
        serviceProviderName: AppText.jackAuto,
        serviceProviderNumber: '+00 00 0000 0000',
        distance: '3.1',
        time: '8',
        amount: '8.92'),
    HistoryData(
        contHeight: 135,
        carNumber: AppText.carNumber,
        country: 'UK',
        date: '20-june-2023',
        service: AppText.recovery,
        serviceNumber: '123456789',
        vehicleLocation: AppText.pickLocation,
        dropOffLocation: AppText.dropOffLocation,
        serviceProviderName: AppText.jackAuto,
        serviceProviderNumber: '+00 00 0000 0000',
        distance: '3.1',
        time: '8',
        amount: '8.92'),
    HistoryData(
        contHeight: 135,
        carNumber: AppText.carNumber,
        country: 'UK',
        date: '20-june-2023',
        service: AppText.recovery,
        serviceNumber: '123456789',
        vehicleLocation: AppText.pickLocation,
        dropOffLocation: AppText.dropOffLocation,
        serviceProviderName: AppText.jackAuto,
        serviceProviderNumber: '+00 00 0000 0000',
        distance: '3.1',
        time: '8',
        amount: '8.92'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomTitleAppBar(
          backGroundColor: AppColors.white, title: AppText.history),
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        height: data[index].contHeight,
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
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomNumberPlateDetailWidget(
                                  carNumber: data[index].carNumber,
                                  countryName: data[index].country,
                                ),
                                Row(
                                  children: [
                                    const SubTitleTextWidget(
                                      text: 'Date ',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: AppColors.grey),
                                    ),
                                    SubTitleTextWidget(
                                      text: data[index].date,
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: AppColors.grey),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Fluttertoast.showToast(msg: 'Coming soon');
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: const CustomIconWidget(
                                      icon: AppIcons.threeDot,
                                      color: AppColors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: MediumText(
                                      text: 'Service:',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                  ),
                                  SubTitleTextWidget(text: AppText.battery)
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: MediumText(
                                        text: 'Service No.',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ),
                                    ),
                                    SubTitleTextWidget(
                                        text: data[index].serviceNumber)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: CustomIconWidget(
                                            icon: AppIcons.dollarCircle),
                                      ),
                                      Row(
                                        children: [
                                          const MediumText(
                                            text: "\$",
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                          MediumText(
                                            text: data[index].amount,
                                            style: const TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            data[index].contHeight! < 200
                                ? Align(
                                    alignment: Alignment.bottomCenter,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          data[index].contHeight = 390;
                                        });
                                      },
                                      child: const SizedBox(
                                          // color: Colors.orange,
                                          height: 23,
                                          width: 20,
                                          child: CustomIconWidget(
                                            icon: AppIcons.more,
                                          )),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            data[index].contHeight! > 200
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Column(
                                      children: [
                                        const Row(
                                          children: [
                                            CustomIconWidget(
                                                icon: AppIcons.vehicleLocation),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SubTitleTextWidget(
                                                        text: AppText
                                                            .vehicleLocation),
                                                    MediumText(
                                                        text: AppText
                                                            .pickLocation)
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Row(
                                            children: [
                                              CustomIconWidget(
                                                  icon:
                                                      AppIcons.dropofflocation),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SubTitleTextWidget(
                                                          text: AppText
                                                              .vehicleLocation),
                                                      MediumText(
                                                          text:
                                                              AppText.jackAuto)
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: Row(
                                            children: [
                                              const CustomIconWidget(
                                                  icon: AppIcons.toolLocation),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SubTitleTextWidget(
                                                          text: AppText
                                                              .serviceProvider),
                                                      const MediumText(
                                                          text:
                                                              AppText.jackAuto),
                                                      SubTitleTextWidget(
                                                          text: data[index]
                                                              .serviceNumber),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0),
                                          child: Row(
                                            children: [
                                              const CustomIconWidget(
                                                  icon: AppIcons.showLocation),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: Row(
                                                  children: [
                                                    MediumText(
                                                      text:
                                                          data[index].distance,
                                                      style: const TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    const MediumText(
                                                      text: ' km',
                                                      style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: CustomIconWidget(
                                                    icon: AppIcons.dottedLine,
                                                    height: 20,
                                                  )),
                                              const CustomIconWidget(
                                                  icon: AppIcons.time),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: MediumText(
                                                  text: '8 min',
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: CustomIconWidget(
                                                    icon: AppIcons.dottedLine,
                                                    height: 20,
                                                  )),
                                              const CustomIconWidget(
                                                  icon: AppIcons.payment),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: MediumText(
                                                  text: data[index].amount,
                                                  style: const TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              data[index].contHeight = 135;
                                            });
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: SizedBox(
                                                // color: Colors.orange,
                                                height: 23,
                                                width: 20,
                                                child: CustomIconWidget(
                                                  icon: AppIcons.less,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HistoryData {
  final String carNumber;
  final String country;
  final String date;
  final String service;
  final String serviceNumber;
  final String vehicleLocation;
  final String dropOffLocation;
  final String serviceProviderName;
  final String serviceProviderNumber;
  final String distance;
  final String time;
  final String amount;
  double? contHeight;

  HistoryData(
      {this.contHeight,
      required this.carNumber,
      required this.country,
      required this.date,
      required this.service,
      required this.serviceNumber,
      required this.vehicleLocation,
      required this.dropOffLocation,
      required this.serviceProviderName,
      required this.serviceProviderNumber,
      required this.distance,
      required this.time,
      required this.amount});
}
