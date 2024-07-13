import 'package:flutter/material.dart';
import 'package:got_stuck/config/app_icons.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/screens/VoucherRedeemScreen/VoucherRedeemScreen.dart';
// import 'package:got_stuck/config/helpers/responsive.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/SubTitleTextWidget.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({super.key});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  final List<CurrentVoucherData> currentVoucherData = [
    CurrentVoucherData(
        serviceNo: '123456789',
        shopName: AppText.tahirBodyWorks,
        type: AppText.mechanics,
        validityDate: '09/25/2019'),
    CurrentVoucherData(
        serviceNo: '123456789',
        shopName: AppText.tahirBodyWorks,
        type: AppText.bodyWorks,
        validityDate: '09/25/2019'),
    CurrentVoucherData(
        serviceNo: '123456789',
        shopName: AppText.tahirBodyWorks,
        type: AppText.bodyWorks,
        validityDate: '09/25/2019'),
  ];

  final List<PastVoucherData> pastVoucherData = [
    PastVoucherData(true,
        serviceNo: '12345678',
        shopName: AppText.tahirBodyWorks,
        type: AppText.mechanics,
        validityDate: '09/25/2019'),
    PastVoucherData(false,
        serviceNo: '12345678',
        shopName: AppText.tahirBodyWorks,
        type: AppText.mechanics,
        validityDate: '09/25/2019'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const CustomIconWidget(icon: AppIcons.backArrow)),
          ),
          title: const MediumText(
            text: AppText.myVoucher,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 24),
          ),
          bottom: const TabBar(
              dividerColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              labelColor: AppColors.black,
              indicatorColor: AppColors.appYellow,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                MediumText(
                  text: AppText.currentVoucher,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                MediumText(
                  text: AppText.pastVoucher,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                )
              ]),
        ),
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              TabBarCurrentVoucherWidget(
                  onBtnTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VoucherRedeemScreen()));
                  },
                  currentVoucherData: currentVoucherData,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VoucherRedeemScreen()));
                  }),
              TabBarPastVoucherWidget(
                onBtnTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VoucherRedeemScreen()));
                },
                pastVoucherData: pastVoucherData,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VoucherRedeemScreen()));
                },
              )
            ]),
      ),
    );
  }
}

class TabBarPastVoucherWidget extends StatelessWidget {
  const TabBarPastVoucherWidget({
    super.key,
    required this.pastVoucherData,
    required this.onTap,
    required this.onBtnTap,
  });

  final List<PastVoucherData> pastVoucherData;
  final VoidCallback onTap;
  final VoidCallback onBtnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ListView.builder(
        itemCount: pastVoucherData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 10),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 20,
                          spreadRadius: 6,
                          color: Color.fromRGBO(0, 0, 0, 0.06))
                    ]),
                child: Row(
                  children: [
                    const CustomIconWidget(icon: AppIcons.simpleVoucher),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const MediumText(
                                    text: AppText.serviceNo,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  MediumText(
                                      text: pastVoucherData[index].serviceNo,
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.grey)),
                                ],
                              ),
                              MediumText(
                                  text: pastVoucherData[index].type,
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(90, 98, 116, 1)))
                            ],
                          ),
                          MediumText(
                              text: pastVoucherData[index].shopName,
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: 59,
                              decoration: BoxDecoration(
                                  color: AppColors.socialIcon,
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.all(5),
                              child: Center(
                                child: Text(
                                  pastVoucherData[index].isUsed
                                      ? AppText.used
                                      : AppText.expired,
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const SubTitleTextWidget(
                                    text: AppText.validUntill,
                                  ),
                                  SubTitleTextWidget(
                                    text: pastVoucherData[index].validityDate,
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: MediumText(
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                            text: AppText.condition)),
                                    Padding(
                                      padding: EdgeInsets.only(top: 3),
                                      child: CustomIconWidget(
                                          icon: AppIcons.nextBold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TabBarCurrentVoucherWidget extends StatelessWidget {
  const TabBarCurrentVoucherWidget({
    super.key,
    required this.currentVoucherData,
    required this.onTap,
    required this.onBtnTap,
  });

  final List<CurrentVoucherData> currentVoucherData;
  final VoidCallback onTap;
  final VoidCallback onBtnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ListView.builder(
        itemCount: currentVoucherData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 10),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 20,
                          spreadRadius: 6,
                          color: Color.fromRGBO(0, 0, 0, 0.06))
                    ]),
                child: Row(
                  children: [
                    const CustomIconWidget(icon: AppIcons.simpleVoucher),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const MediumText(
                                    text: AppText.serviceNo,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  MediumText(
                                      text: currentVoucherData[index].serviceNo,
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.grey)),
                                ],
                              ),
                              MediumText(
                                  text: currentVoucherData[index].type,
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(90, 98, 116, 1)))
                            ],
                          ),
                          MediumText(
                              text: currentVoucherData[index].shopName,
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const SubTitleTextWidget(
                                      text: AppText.validUntill,
                                    ),
                                    SubTitleTextWidget(
                                      text: currentVoucherData[index]
                                          .validityDate,
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: MediumText(
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                              text: AppText.condition)),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3),
                                        child: CustomIconWidget(
                                            icon: AppIcons.nextBold),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CurrentVoucherData {
  final String serviceNo;
  final String shopName;
  final String type;
  final String validityDate;

  CurrentVoucherData(
      {required this.serviceNo,
      required this.shopName,
      required this.type,
      required this.validityDate});
}

class PastVoucherData {
  final String serviceNo;
  final String shopName;
  final String type;
  final String validityDate;
  final bool isUsed;

  PastVoucherData(this.isUsed,
      {required this.serviceNo,
      required this.shopName,
      required this.type,
      required this.validityDate});
}
