
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:got_stuck/config/app_icons.dart';
import 'package:got_stuck/config/app_images.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/config/helpers/responsive.dart';
import 'package:got_stuck/dataModels/singlePetrolPumpDetail.dart';
import 'package:got_stuck/widgets/AppText/large_text.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/SubTitleTextWidget.dart';
import 'package:got_stuck/widgets/TitleTextWidget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/app_text.dart';
import '../../widgets/AppText/CustomLikeButton.dart';
// import 'package:got_stuck/screens/PetrolPumpModule/SinglePetrolPumpScreen.dart';

class SinglePetrolPumpScreen extends StatefulWidget {
  const SinglePetrolPumpScreen({super.key});

  @override
  State<SinglePetrolPumpScreen> createState() => _SinglePetrolPumpScreenState();
}

class _SinglePetrolPumpScreenState extends State<SinglePetrolPumpScreen> {
  final Uri url1 = Uri.parse(AppText.googleMaps);
  final List<SinglePetrolPump> data = [
    SinglePetrolPump(
        fuelName: AppText.unLeaded, price: '149.7p', timesAgo: '4 days ago'),
    SinglePetrolPump(
        fuelName: AppText.superunLeaded,
        price: '149.7p',
        timesAgo: '4 days ago'),
    SinglePetrolPump(
        fuelName: AppText.diesel, price: '149.7p', timesAgo: '4 days ago'),
    SinglePetrolPump(
        fuelName: AppText.premiumPetrol,
        price: '149.7p',
        timesAgo: '4 days ago'),
  ];
  bool liked = false;
  bool disliked = false;
  int counter = 0;
  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      // statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Image.asset(
                    AppImages.largePump1,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 10),
                    child: IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(
                          AppIcons.backArrow,
                          color: AppColors.white,
                        )))
              ],
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          LargeText(
                            text: AppText.petrolPump,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          SubTitleTextWidget(text: 'Estimated: 3 Miles, 15 min')
                        ]),
                    IconButton(
                        splashRadius: 25,
                        onPressed: () {
                          setState(() {
                            launchUrl(url1,
                                mode: LaunchMode.externalApplication);
                          });
                        },
                        icon: SvgPicture.asset(
                          AppIcons.go,
                        ))
                  ],
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleTextWidget(text: AppText.location),
                    const Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: MediumText(
                          text: AppText.londonAddress,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.like),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: SubTitleTextWidget(
                              text: '10',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(151, 173, 182, 1)),
                            ),
                          ),
                          SvgPicture.asset(AppIcons.dislike),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: SubTitleTextWidget(
                              text: '10',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(151, 173, 182, 1)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          // color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MediumText(
                                  text: data[index].fuelName,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const SubTitleTextWidget(text: 'Price'),
                                  TitleTextWidget(
                                      text: data[index].price,
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  SubTitleTextWidget(text: data[index].timesAgo)
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LikeButtonWidget(
                    state: liked,
                    filledSvg: AppIcons.likeFill,
                    unfilledSvg: AppIcons.like,
                    onTap: () {
                      setState(() {
                        setState(() {
                          if (liked == true) {
                            liked = false;
                          } else
                            liked = true;
                        });
                      });
                    },
                  ),
                  LikeButtonWidget(
                    state: disliked,
                    filledSvg: AppIcons.dislikeFill,
                    unfilledSvg: AppIcons.dislike,
                    onTap: () {
                      setState(() {
                        if (disliked == true) {
                          disliked = false;
                        } else
                          disliked = true;
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
