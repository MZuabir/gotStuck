import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:got_stuck/config/helpers/responsive.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';

import '../../config/app_icons.dart';
import '../../config/app_images.dart';
import '../../config/app_text.dart';
import '../../config/colors.dart';
import '../../widgets/AppText/large_text.dart';
import '../../widgets/AppText/medium_text.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const CustomIconWidget(
                icon: AppIcons.backArrow,
              )),
          centerTitle: true,
          scrolledUnderElevation: 0,
          title: const LargeText(
            text: 'Products List',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 24),
          )),
      body: SafeArea(
        child: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(3, 3),
                                      blurRadius: 10,
                                      spreadRadius: 0,
                                      color: Color.fromRGBO(105, 62, 255, 0.15))
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AppImages.oilDrop,
                                  height: 130,
                                  fit: BoxFit.contain,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 5, top: 30),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              MediumText(
                                                text: AppText.oilChange,
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        AppColors.lightGreyTxt),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: LargeText(
                                                  text: AppText.fourtyFive,
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 16,
                                                      color: AppColors.blue),
                                                ),
                                              )
                                            ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: SvgPicture.asset(AppIcons.star),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(left: 10, top: 10),
                                        child: Text(
                                          AppText.listText,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Poppins',
                                              fontSize: 10,
                                              color: AppColors.txtSecondry),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 19,
                              width: 85,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 5),
                              decoration: const BoxDecoration(
                                  color: AppColors.discountColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(6),
                                      bottomLeft: Radius.circular(6))),
                              child: const MediumText(
                                text: AppText.discount,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 8,
                                    color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
