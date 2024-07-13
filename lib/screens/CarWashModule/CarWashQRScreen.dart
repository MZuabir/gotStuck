import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:got_stuck/config/app_images.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/screens/ChatScreen/ChatPage.dart';
import 'package:got_stuck/widgets/AppText/CustomWhiteButtonWidget.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import '../../config/app_icons.dart';
import '../../config/colors.dart';
import '../../widgets/CustomTitleAppBar.dart';
import '../../widgets/SubTitleTextWidget.dart';
import '../../widgets/TitleTextWidget.dart';
import '../../widgets/customIconWidget.dart';
import 'CarWashMainScreen.dart';

class CarWashQRScreen extends StatefulWidget {
  const CarWashQRScreen({super.key});

  @override
  State<CarWashQRScreen> createState() => _CarWashQRScreenState();
}

class _CarWashQRScreenState extends State<CarWashQRScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomTitleAppBar(
          backGroundColor: AppColors.white, title: AppText.carWash),
      body: SafeArea(
          child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColors.socialIcon,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TitleTextWidget(text: AppText.tahirBodyWorks),
                                  TitleTextWidget(text: '£ 5.99'),
                                ]),
                            const SubTitleTextWidget(
                              text: '3 Miles, 15 min',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColors.darkGrey),
                            ),
                            CustomRatingWidget(
                                rating: 5,
                                selectedColor: AppColors.appYellow,
                                unselectedColor: AppColors.white,
                                onChanged: (value) {}),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, right: 5, bottom: 5),
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              226, 230, 233, 1),
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: const SubTitleTextWidget(
                                          text: AppText.automaticWash)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, right: 5, bottom: 5),
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              226, 230, 233, 1),
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: const SubTitleTextWidget(
                                          text: AppText.labor)),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomWhiteButtonWidget(
                                      width: 140,
                                      onTap: () {
                                        setState(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChatPage()));
                                        });
                                      },
                                      icon: AppIcons.messageYlw,
                                      text: AppText.message),
                                  CustomWhiteButtonWidget(
                                      width: 140,
                                      onTap: () {
                                        Fluttertoast.showToast(
                                            msg: 'Coming soon');
                                      },
                                      icon: AppIcons.callYlw,
                                      text: AppText.call),
                                ],
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 20, left: 80, right: 80, bottom: 10),
                                child: CustomIconWidget(icon: AppImages.qr)),
                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: MediumText(
                                text: AppText.scanYourVoucherFrom,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                                align: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: AppColors.black),
                            onPressed: () {
                              Fluttertoast.showToast(msg: 'Coming soon');
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: MediumText(
                                text: AppText.howTORedeemVoucher,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: AppColors.white),
                              ),
                            )),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      CustomNumberWidget(number: 1),
                                      MediumText(
                                        text: AppText.buyYourWoucher,
                                        style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                        align: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      CustomNumberWidget(number: 2),
                                      MediumText(
                                        text: AppText.receiveACode,
                                        style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                        align: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomIconWidget(
                                    icon: AppImages.voucherDeal,
                                    height: 80,
                                  ),
                                  CustomIconWidget(
                                    icon: AppImages.arrowRight,
                                    height: 50,
                                  ),
                                  CustomIconWidget(
                                    icon: AppImages.voucherEmail,
                                    height: 80,
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomIconWidget(
                                  icon: AppImages.arrowDown,
                                  height: 50,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      CustomNumberWidget(number: 4),
                                      MediumText(
                                        text: AppText.enjoyYour,
                                        style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                        align: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      CustomNumberWidget(number: 3),
                                      MediumText(
                                        text: AppText.redeemWowcher,
                                        style: TextStyle(
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                        align: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: [
                                  CustomIconWidget(
                                    icon: AppImages.voucherEnjoy,
                                    height: 80,
                                  ),
                                  CustomIconWidget(
                                    icon: AppImages.arrowleft,
                                    height: 50,
                                  ),
                                  CustomIconWidget(
                                    icon: AppImages.voucherRedeem,
                                    height: 80,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

class CustomNumberWidget extends StatelessWidget {
  const CustomNumberWidget({
    super.key,
    required this.number,
  });
  final int number;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppColors.appYellow),
          borderRadius: BorderRadius.circular(20)),
      height: 22,
      width: 22,
      child: Center(
        child: MediumText(
          text: number.toString(),
          style: const TextStyle(
              fontFamily: 'Arial',
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.appYellow),
        ),
      ),
    );
  }
}
