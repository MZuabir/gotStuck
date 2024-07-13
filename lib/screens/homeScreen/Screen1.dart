import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:got_stuck/config/app_icons.dart';
import 'package:got_stuck/config/app_images.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/dataModels/tabDataModel.dart';
import 'package:got_stuck/screens/AllListScreen/ProductListScreen.dart';
import 'package:got_stuck/screens/CarWashModule/CarWashMainScreen.dart';
import 'package:got_stuck/screens/NotificationScreen/NotificationScreen.dart';
import 'package:got_stuck/screens/TabbarPractise/NewTabbar.dart';
import 'package:got_stuck/screens/batteryModule/BatteryLocationScreen.dart';
import 'package:got_stuck/screens/homeScreen/Screen2.dart';
import 'package:got_stuck/screens/homeScreen/Screen4.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/helpers/responsive.dart';
import '../../widgets/AppBar.dart';
import '../../widgets/AppText/large_text.dart';
import '../../widgets/AppText/medium_text.dart';
import '../../widgets/CarDetail.dart';
import '../../widgets/CustomGridContainer.dart';
import '../../widgets/PetrolPumpDetailButton.dart';
// import '../../widgets/customIconWidget.dart';
// import '../../widgets/custom_tabbar.dart';
import '../PetrolPumpModule/PetrolPumpListScreen.dart';
import '../RecoveryModule/RecoveryMainScreen.dart';
// import '../TabbarPractise/NewTabbar.dart';
import '../batteryModule/BatteryMainScreen.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with TickerProviderStateMixin {
  late TabController tabController;
  int index = 0;
  String mail = '';

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    getPhoto();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void getPhoto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      mail = prefs.getString('mail')!;
    });
  }

  final List<TabData> data1 = [
    TabData(svg: AppIcons.recovery, text: AppText.recovery),
    TabData(svg: AppIcons.battery, text: AppText.battery),
    TabData(svg: AppIcons.flatTyre, text: AppText.flatTyre),
    TabData(svg: AppIcons.outFuel, text: AppText.outFuel),
    TabData(svg: AppIcons.lockedOut, text: AppText.lockedOut),
    TabData(svg: AppIcons.mechanical, text: AppText.mechanical),
    // TabData(svg: 'assets/icons/mechanical.svg', text: 'Mechanical'),
    // TabData(svg: AppIcons.lockedOut, text: AppText.lockedOut),
    // TabData(svg: AppIcons.mechanical, text: AppText.mechanical),
    // TabData(svg: 'assets/icons/mechanical.svg', text: 'Mechanical'),
    // TabData(svg: 'assets/icons/mechanical.svg', text: 'Mechanical'),
    // TabData(svg: AppIcons.lockedOut, text: AppText.lockedOut),
    // TabData(svg: AppIcons.mechanical, text: AppText.mechanical),
    // TabData(svg: 'assets/icons/mechanical.svg', text: 'Mechanical'),
  ];
  final List<TabData> data2 = [
    TabData(svg: AppIcons.carWash, text: AppText.carWash),
    TabData(svg: AppIcons.carServices, text: AppText.carService),
    TabData(svg: AppIcons.brakePads, text: AppText.brakePads),
    TabData(svg: AppIcons.spareParts, text: AppText.spareParts),
    TabData(svg: AppIcons.bodyWorks, text: AppText.bodyWorks),
    TabData(svg: AppIcons.mechanical, text: AppText.mechanical),
    TabData(svg: 'assets/icons/aircondition.svg', text: AppText.airCondition),
    TabData(svg: 'assets/icons/interior.svg', text: AppText.interior),
    TabData(svg: 'assets/icons/electrical.svg', text: AppText.electrical),
  ];
  late TabController mytabController = TabController(length: 2, vsync: this);
  int currentIndex = 0;
  bool _toggleValue1 = false;
  bool _toggleValue2 = true;
  PageController? controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              height: screenHeight(context),
              width: screenWidth(context),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 20, left: 10, right: 10),
                    child: CustomAppBar(
                      profileTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Screen4(
                                      isBack: true,
                                    )));
                      },
                      mail: mail,
                      notificationTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationScreen()));
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Screen2(
                                    isBacked: true,
                                  )));
                    },
                    child: const CarDetail(
                        carName: AppText.carName,
                        carNumber: AppText.carNumber,
                        countryName: AppText.uk),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: PetrolPumpDetailButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              (MaterialPageRoute(
                                  builder: (context) =>
                                      const PetrolPumpListScreen())));
                        },
                      )),
                  // AnimatedToggle(
                  //   values: const ['Roadside', 'Onsite'],
                  //   onToggleCallback: (value) {
                  //     setState(() {
                  //       _toggleValue = value;
                  //     });
                  //   },
                  //   buttonColor: const Color(0xFF0A3157),
                  //   backgroundColor: const Color(0xFFB5C1CC),
                  //   textColor: const Color(0xFFFFFFFF),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      height: 57,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.tabBorderColor, width: 2),
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(29)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomSwitch(
                            text: 'Roadside',
                            value: _toggleValue1,
                            onChanged: (value) {
                              setState(() {
                                // _toggleValue1 = value;
                                // _toggleValue2 != _toggleValue1;
                                _toggleValue1 = false;
                                _toggleValue2 = true;
                              });
                            },
                          ),
                          CustomSwitch(
                            text: 'Onsite',
                            value: _toggleValue2,
                            onChanged: (value) {
                              setState(() {
                                _toggleValue1 = true;
                                _toggleValue2 = false;
                                // _toggleValue2 = value;
                                // _toggleValue1 != _toggleValue2;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                      //   child: CustomTabBar(
                      //     index: index,
                      //     tabs: const ['Roadside', 'Onsite'],
                      //     firstTitle: AppText.tabBtn1,
                      //     secondTitle: AppText.tabBtn2,
                      //     children: [
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: (_toggleValue1 == false &&
                                  _toggleValue2 == true)
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 10,
                                          right: 30),
                                      child: MediumText(
                                        text: AppText.servicesOnRoadSide,
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                        align: TextAlign.left,
                                      ),
                                    ),
                                    Expanded(
                                        child: GridView.builder(
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      itemCount: data1.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 15),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            switch (data1[index].text) {
                                              case AppText.recovery:
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const RecoveryMainScreen()));
                                                break;
                                              case AppText.battery:
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const BatteryMainScreen()));
                                                break;
                                              case AppText.flatTyre:
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const BatteryLocationScreen(
                                                              title: AppText
                                                                  .flatTyre,
                                                            )));
                                                break;
                                              case AppText.outFuel:
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const BatteryLocationScreen(
                                                              title: AppText
                                                                  .outFuel,
                                                            )));
                                                break;
                                              case AppText.lockedOut:
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const BatteryLocationScreen(
                                                                title: AppText
                                                                    .lockedOut)));
                                                break;
                                              case AppText.mechanical:
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const BatteryLocationScreen(
                                                                title: AppText
                                                                    .mechanical)));
                                            }
                                          },
                                          child: CustomGridContainer(
                                              icon: data1[index].svg,
                                              text: data1[index].text),
                                        );
                                      },
                                    )),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: MediumText(
                                        text: AppText.servicesonSite,
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                        align: TextAlign.left,
                                      ),
                                    ),
                                    Expanded(
                                      child: GridView.builder(
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.all(5),
                                        itemCount: data2.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 15),
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              switch (data2[index].text) {
                                                case AppText.carWash:
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const CarWashMainScreen()));
                                                  break;
                                                case AppText.carService:
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const BatteryLocationScreen(
                                                                title: AppText
                                                                    .carService,
                                                              )));
                                                  break;
                                                case AppText.brakePads:
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const BatteryLocationScreen(
                                                                title: AppText
                                                                    .brakePads,
                                                              )));
                                                  break;
                                                case AppText.spareParts:
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const BatteryLocationScreen(
                                                                title: AppText
                                                                    .spareParts,
                                                              )));
                                                  break;
                                                case AppText.bodyWorks:
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const BatteryLocationScreen(
                                                                title: AppText
                                                                    .bodyWorks,
                                                              )));
                                                  break;
                                                case AppText.mechanical:
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const BatteryLocationScreen(
                                                                title: AppText
                                                                    .mechanical,
                                                              )));
                                                  break;
                                                case AppText.airCondition:
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const BatteryLocationScreen(
                                                                title: AppText
                                                                    .airCondition,
                                                              )));
                                                  break;
                                                case AppText.interior:
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const BatteryLocationScreen(
                                                                title: AppText
                                                                    .interior,
                                                              )));
                                                  break;
                                                case AppText.electrical:
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const BatteryLocationScreen(
                                                                  title: AppText
                                                                      .electrical)));
                                                  break;
                                              }
                                            },
                                            child: CustomGridContainer(
                                                icon: data2[index].svg,
                                                text: data2[index].text),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ))),
                  const TopRated_SeeAllButtonWidget(),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const CustomListContainerWidget(
                          labelText: AppText.oilChange,
                          discountLabelText: AppText.discount,
                          price: AppText.fourtyFive,
                          description: AppText.listText,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopRated_SeeAllButtonWidget extends StatelessWidget {
  const TopRated_SeeAllButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () {},
              child: const MediumText(
                text: AppText.topRated,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: AppColors.black),
              )),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductListScreen()));
              },
              child: const MediumText(text: AppText.seeAll))
        ],
      ),
    );
  }
}

class CustomListContainerWidget extends StatelessWidget {
  const CustomListContainerWidget({
    super.key,
    required this.labelText,
    required this.discountLabelText,
    required this.price,
    required this.description,
  });
  final String labelText;
  final String discountLabelText;
  final String price;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          FittedBox(
            child: Container(
              width: 320,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(3, 3),
                        blurRadius: 10,
                        spreadRadius: 0,
                        color: AppColors.boxshadowColor)
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5, top: 30),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MediumText(
                                  text: AppText.oilChange,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.lightGreyTxt),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: LargeText(
                                    text: AppText.fourtyFive,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: AppColors.blue),
                                  ),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SvgPicture.asset(AppIcons.star),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
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
          Positioned(
              top: 10,
              right: 0,
              child: Container(
                height: 19,
                width: 85,
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
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
              )),
        ],
      ),
    );
  }
}

// Wrap(
                              //   runSpacing: 10,
                              //   spacing: 15,
                              //   children: data2
                              //       .map(
                              //         (tabData) => GestureDetector(
                              //           onTap: () {
                              //             switch (tabData.text) {
                              //               case AppText.carWash:
                              //                 Navigator.push(
                              //                     context,
                              //                     MaterialPageRoute(
                              //                         builder: (context) =>
                              //                             const CarWashMainScreen()));
                              //                 break;
                              //             }
                              //           },
                              //           child: CustomGridContainer(
                              //               icon: tabData.svg,
                              //               text: tabData.text),
                              //         ),
                              //       )
                              //       .toList(),
                              // ),