import 'package:flutter/material.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/widgets/CustomNumberPlateDetailWidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'AppText/large_text.dart';

class CarDetail extends StatefulWidget {
  final String carName;
  final String carNumber;
  final String countryName;
  final double? dotsBottomSpacing;
  final double? dotsLeftSpacing;
  final double? height;
  const CarDetail(
      {super.key,
      required this.carName,
      required this.carNumber,
      required this.countryName,
      this.dotsBottomSpacing,
      this.dotsLeftSpacing,
      this.height});

  @override
  State<CarDetail> createState() => _CarDetailState();
}

class _CarDetailState extends State<CarDetail> {
  PageController controller = PageController();
  int pageIndex = 0, currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 105,
          // height: (widget.height ?? screenHeight(context) / 7.5) + 15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 90,
                // height: (widget.height ?? screenHeight(context) / 7.5),
                width: double.infinity,
                color: AppColors.white,
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: PageView.builder(
                      controller: controller,
                      itemCount: 3,
                      onPageChanged: (val) {
                        setState(() {
                          pageIndex = val;
                        });
                      },
                      itemBuilder: (_, i) {
                        currentPage = i;
                        return SizedBox(
                          child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: (LargeText(
                                    text: widget.carName.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                        fontFamily: 'Roboto'),
                                  )),
                                ),
                                CustomNumberPlateDetailWidget(
                                    countryName: widget.countryName,
                                    carNumber: widget.carNumber),
                              ]),
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SmoothPageIndicator(
                  effect: const ExpandingDotsEffect(
                      dotColor: AppColors.grey,
                      activeDotColor: Colors.black,
                      dotHeight: 5,
                      dotWidth: 5,
                      expansionFactor: 5),
                  count: 3,
                  controller: controller,
                ),
              ),
            ],
          ),
        ),

        // Positioned(
        //     bottom: widget.dotsBottomSpacing ?? 0,
        //     left: 0,
        //     // left: widget.dotsLeftSpacing ?? screenWidth(context) / 2.2, // / 2.2
        //     right: 0,
        //     child:
        //     // Row(
        //     //   children: List.generate(3, (index) => BuildDots(index, context)),
        //     // ),
        //     ),
      ],
    );
  }

  // BuildDots(int index, BuildContext context) {
  //   return Container(
  //     height: 4,
  //     width: pageIndex == index ? 24 : 4,
  //     margin: const EdgeInsets.only(right: 5),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(16),
  //       color: pageIndex == index
  //           ? Colors.black
  //           : const Color.fromRGBO(156, 155, 155, 1),
  //     ),
  //   );
  // }
}
