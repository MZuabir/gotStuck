import 'package:flutter/material.dart';
import 'package:got_stuck/config/app_images.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/CustomTitleAppBar.dart';
// import 'package:got_stuck/widgets/RoundedButton.dart';
import 'package:got_stuck/widgets/TitleTextWidget.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';
import '../../config/app_icons.dart';
import 'package:intl/intl.dart';

class VoucherRedeemScreen extends StatefulWidget {
  const VoucherRedeemScreen({super.key});

  @override
  State<VoucherRedeemScreen> createState() => _VoucherRedeemScreenState();
}

class _VoucherRedeemScreenState extends State<VoucherRedeemScreen> {
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: const CustomTitleAppBar(
            backGroundColor: AppColors.white, title: AppText.myVoucher),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      width: double.infinity,
                      child: const Center(
                        child: MediumText(
                            text: AppText.redeemYourVoucher,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white)),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 21),
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 54,
                                  spreadRadius: 16,
                                  color: Color.fromRGBO(0, 0, 0, 0.19))
                            ],
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            const Row(children: [
                              CustomIconWidget(icon: AppIcons.simpleVoucher),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          MediumText(
                                            text: AppText.serviceNo,
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          MediumText(
                                              text: '12345678',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.grey)),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MediumText(
                                            text: AppText.price,
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.grey)),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 5),
                                              child: CustomIconWidget(
                                                  icon: AppImages.money),
                                            ),
                                            MediumText(
                                              text: '5.99',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ]),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: TitleTextWidget(
                                text: AppText.tahirBodyWorks,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 90),
                                child: CustomIconWidget(icon: AppImages.qr)),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MediumText(
                                    text: AppText.exteriorWash,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    )),
                                MediumText(
                                    text: AppText.fullWash,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MediumText(
                                      text: AppText.fullServiceHand,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  MediumText(
                                      text: AppText.interiorWash,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ],
                              ),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MediumText(
                                    text: AppText.hotWax,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    )),
                                MediumText(
                                    text: AppText.softTouch,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 40),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: AppColors.socialIcon,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                        controller: dateinput,
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10)),
                                        readOnly: true,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(
                                                    2000),
                                                lastDate: DateTime(2101));

                                        if (pickedDate != null) {
                                          print(
                                              pickedDate); 
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd').format(
                                                  pickedDate); 

                                          setState(() {
                                            dateinput.text =
                                                formattedDate; 
                                          });
                                        } else {}
                                      },
                                      child: const CustomIconWidget(
                                          icon: AppIcons.datePicker),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: AppColors.appYellow,
                                      foregroundColor: AppColors.white),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: MediumText(
                                      text: AppText.redeem,
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )),
                            )
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
