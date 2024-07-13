import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:got_stuck/config/app_images.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/config/helpers/responsive.dart';
import 'package:got_stuck/screens/CarWashModule/CarWashQRScreen.dart';
import 'package:got_stuck/screens/WalletFormScreen/WalletFormScreen.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/RoundedButton.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';

import '../../config/app_icons.dart';
import '../../widgets/AppText/large_text.dart';

class CarousalWalletScreen extends StatefulWidget {
  const CarousalWalletScreen({super.key});

  @override
  State<CarousalWalletScreen> createState() => _CarousalWalletScreenState();
}

class _CarousalWalletScreenState extends State<CarousalWalletScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const CustomIconWidget(icon: AppIcons.backArrow)),
                const Padding(
                    padding: EdgeInsets.only(left: 80),
                    child: LargeText(
                      text: AppText.wallet,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    )),
              ]),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.06),
                            offset: Offset(
                              0,
                              4,
                            ),
                            blurRadius: 20,
                            spreadRadius: 6)
                      ],
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 20),
                        child: Row(
                          children: [
                            CustomIconWidget(icon: AppIcons.card),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: MediumText(
                                text: AppText.creditCards,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        width: 400,
                        child: CarouselSlider.builder(
                            itemCount: 3,
                            itemBuilder: (context, index, realIndex) {
                              return Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  const CustomIconWidget(
                                    icon: AppImages.card,
                                  ),
                                  index == currentIndex
                                      ? const Padding(
                                          padding: EdgeInsets.only(right: 17),
                                          child: CustomIconWidget(
                                            icon: AppIcons.check,
                                            height: 5,
                                            width: 5,
                                          ),
                                        )
                                      : Container()
                                ],
                              );
                            },
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                              enlargeFactor: 0.3,
                              clipBehavior: Clip.none,
                              enableInfiniteScroll: true,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              autoPlay: false,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: AppColors.socialIcon,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const WalletFormScreen()));
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 7),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child:
                                          CustomIconWidget(icon: AppIcons.add)),
                                  MediumText(
                                    text: AppText.addCard,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.appYellow),
                                  )
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CustomPaymentButton(
                      onTap: () {
                        Fluttertoast.showToast(msg: 'Coming soon');
                      },
                      icon: AppIcons.payPal,
                      paymentMethod: AppText.payPal,
                    ),
                  ),
                  CustomPaymentButton(
                    onTap: () {
                      Fluttertoast.showToast(msg: 'Coming soon');
                    },
                    icon: AppImages.google,
                    paymentMethod: AppText.googlePay,
                  ),
                  CustomPaymentButton(
                    onTap: () {
                      Fluttertoast.showToast(msg: 'Coming soon');
                    },
                    icon: AppIcons.appleSmall,
                    paymentMethod: AppText.applePay,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: RoundedButton(
                      text: AppText.select,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CarWashQRScreen()));
                      },
                      txtColor: AppColors.white,
                      backgroundColor: AppColors.black),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class CustomPaymentButton extends StatelessWidget {
  const CustomPaymentButton({
    super.key,
    required this.icon,
    required this.paymentMethod,
    required this.onTap,
  });
  final String icon;
  final String paymentMethod;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.06),
                  offset: Offset(0, 4),
                  blurRadius: 20,
                  spreadRadius: 6)
            ]),
        child: TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 10, left: 15),
                          child: CustomIconWidget(
                            icon: icon,
                          )),
                      MediumText(
                        text: paymentMethod,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: CustomIconWidget(
                      icon: AppImages.more,
                      height: 20,
                      width: 20,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
