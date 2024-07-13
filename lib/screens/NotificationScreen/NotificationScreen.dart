import 'package:flutter/material.dart';
import 'package:got_stuck/config/app_icons.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/config/helpers/responsive.dart';
import 'package:got_stuck/dataModels/NotificationData.dart';
import 'package:got_stuck/widgets/SubTitleTextWidget.dart';
import 'package:got_stuck/widgets/TitleTextWidget.dart';

import '../../widgets/CustomTitleAppBar.dart';
import '../../widgets/SigleNotificationWidget.dart';
import '../../widgets/customIconWidget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // final List<NotificationData> data1 = [
  //   NotificationData(
  //       icon: 'assets/icons/award.svg',
  //       subTitle: 'MOT of Vehicle SL57 OSV is expired',
  //       title: 'MOT Expired',
  //       timesAgo: '1m ago'),
  //   NotificationData(
  //       icon: 'assets/icons/sendmoney.svg',
  //       subTitle: ' TAXED Vehicle SL57 OSV is expired',
  //       title: 'Tax Expired',
  //       timesAgo: '10m ago'),
  //   NotificationData(
  //       icon: 'assets/icons/sendmoney.svg',
  //       subTitle: ' TAXED Vehicle SL57 OSV is expired',
  //       title: 'Tax Expired',
  //       timesAgo: '10m ago'),
  // ];
  final List<NotificationData> data2 = [
    NotificationData(
        icon: AppIcons.serviceBox,
        subTitle: AppText.serviceProviderArrivedNearYou,
        title: AppText.serviceProviderArrived,
        timesAgo: 'Dec 23'),
    NotificationData(
        icon: AppIcons.sendMoney,
        subTitle: AppText.voucherNoHasbeen,
        title: AppText.voucherPurchased,
        timesAgo: 'Dec 20'),
    NotificationData(
        icon: AppIcons.serviceBox,
        subTitle: AppText.voucherNoHasbeen,
        title: AppText.voucherRedeem,
        timesAgo: 'Dec 19'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: const CustomTitleAppBar(
            backGroundColor: AppColors.white, title: AppText.notification),
        body: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SubTitleTextWidget(
                            text: AppText.today,
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(107, 114, 128, 1)),
                          ),
                        ),
                        // NotificationList(dataList: data1),
                        const SingleNotificationWidget(
                            icon: AppIcons.award,
                            subTitle: AppText.motOfVehicleExpired,
                            title: AppText.motExpired,
                            timesAgo: AppText.minAgo),
                        const SingleNotificationWidget(
                            icon: AppIcons.sendMoney,
                            subTitle: AppText.motOfVehicleExpired,
                            title: AppText.motExpired,
                            timesAgo: AppText.minAgo),
                        const SingleNotificationWidget(
                            icon: AppIcons.sendMoney,
                            subTitle: AppText.motOfVehicleExpired,
                            title: AppText.motExpired,
                            timesAgo: AppText.minAgo),
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: SubTitleTextWidget(
                            text: AppText.thisWeek,
                            style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(107, 114, 128, 1)),
                          ),
                        ),
                        NotificationList(dataList: data2)
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}

class NotificationList extends StatelessWidget {
  const NotificationList({
    super.key,
    required this.dataList,
  });

  final List<NotificationData> dataList;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: Container(
            // color: Colors.orange,
            height: 230,
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                              color: AppColors.socialIcon,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: CustomIconWidget(
                              icon: dataList[index].icon,
                              // height: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TitleTextWidget(
                                        text: dataList[index].title,
                                        style: const TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    SubTitleTextWidget(
                                      text: dataList[index].timesAgo,
                                      style: const TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromRGBO(107, 114, 128, 1)),
                                    )
                                  ],
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: SubTitleTextWidget(
                                        text: dataList[index].subTitle))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                })));
  }
}
