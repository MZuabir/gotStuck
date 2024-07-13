import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/config/helpers/responsive.dart';
import 'package:got_stuck/screens/ChatScreen/ChatPage.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/RoundedButton.dart';
import 'package:got_stuck/widgets/SubTitleTextWidget.dart';
import 'package:got_stuck/widgets/TitleTextWidget.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';

import '../CarWashModule/CarWashMainScreen.dart';


class DialogPopUp extends StatefulWidget {
  const DialogPopUp({super.key});

  @override
  State<DialogPopUp> createState() => _DialogPopUpState();
}

class _DialogPopUpState extends State<DialogPopUp> {
  double rating = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: const Text('PopUp'),
        onPressed: () {
          setState(() {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  insetPadding: EdgeInsets.zero,
                  content: contentBox(context),
                );
              },
            );
          });
        },
      )),
    );
  }

  contentBox(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          height: 500,
          width: screenWidth(context) * 0.9,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                    color: AppColors.appYellow,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: const [
                    MediumText(
                      text: 'Your Service is',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white),
                    ),
                    TitleTextWidget(
                      text: 'Completed',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 10, left: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          MediumText(
                              text: 'Service No. 123456789',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              )),
                          SubTitleTextWidget(text: 'Date: 20-june-2023')
                        ],
                      ),
                    ),
                    Row(
                      children: const [
                        CustomIconWidget(icon: 'assets/icons/redLocation.svg'),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: MediumText(text: '6, Loxford Lane, IG1 2UT'))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Row(
                        children: const [
                          CustomIconWidget(
                              icon: 'assets/icons/toolLocation.svg'),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: MediumText(text: 'Jack Auto Station')),
                          MediumText(
                            text: '4.9',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: CustomIconWidget(
                                  icon: 'assets/icons/ratingStar.svg'))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: const [
                          CustomIconWidget(
                              icon: 'assets/icons/showLocation.svg'),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: MediumText(
                              text: '3.1',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: CustomIconWidget(
                                  icon: 'assets/icons/dottedLine.svg')),
                          CustomIconWidget(icon: 'assets/icons/time.svg'),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: MediumText(
                              text: '8 min',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: CustomIconWidget(
                                  icon: 'assets/icons/dottedLine.svg')),
                          CustomIconWidget(icon: 'assets/icons/payment.svg'),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: MediumText(
                              text: '8.92',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: const Color.fromRGBO(233, 233, 233, 1)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            const TitleTextWidget(
                              text:
                                  'Please give us a feedback about service Provider',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                              align: TextAlign.center,
                            ),
                            CustomRatingWidget(
                                size: 30,
                                rating: rating,
                                selectedColor: AppColors.appYellow,
                                unselectedColor: AppColors.grey,
                                onChanged: (val) {
                                  setState(() {
                                    rating = val;
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                    RoundedButton(
                        text: 'Okay',
                        onTap: () {},
                        txtColor: AppColors.white,
                        backgroundColor: AppColors.black)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RichText(
                  text: TextSpan(
                      text: 'If you face any issue in service Please.',
                      style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey),
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatPage()));
                              },
                            text: ' Click Here',
                            style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black))
                      ]),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
