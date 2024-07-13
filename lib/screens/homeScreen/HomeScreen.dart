import 'package:flutter/material.dart';
import 'package:got_stuck/config/app_icons.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/screens/homeScreen/Screen1.dart';
import 'package:got_stuck/screens/homeScreen/Screen2.dart';
import 'package:got_stuck/screens/homeScreen/Screen3.dart';
import 'package:got_stuck/screens/homeScreen/Screen4.dart';
import '../../widgets/RoundedButton.dart';
import '../../widgets/customIconWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late int navPageIndex;
  late List<Widget> pages;
  late PageController pageController;
  @override
  void initState() {
    navPageIndex = 0;
    pages = [
      const Screen1(),
      const Screen2(),
      const Screen3(),
      const Screen4()
    ];
    pageController = PageController(initialPage: navPageIndex);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }
  // final pages = [
  //   const Screen1(),
  //   const Screen2(),
  //   const Screen3(),
  //   const Screen4(),
  // ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: AppColors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              title: const Center(child: Text('Please Confirm')),
              content: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Are you sure you want to exit?',
                    textAlign: TextAlign.center,
                  )),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: RoundedButton(
                            height: 45,
                            text: AppText.no,
                            onTap: () {
                              Navigator.of(context).pop(false);
                            },
                            txtColor: AppColors.white,
                            backgroundColor: AppColors.black),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: RoundedButton(
                            height: 45,
                            text: AppText.yes,
                            onTap: () {
                              Navigator.of(context).pop(true);
                            },
                            txtColor: AppColors.white,
                            backgroundColor: AppColors.appYellow),
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        );
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.white,
          currentIndex: navPageIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.black,
          selectedLabelStyle: const TextStyle(color: AppColors.black),
          unselectedItemColor: const Color.fromRGBO(171, 176, 191, 1),
          onTap: (value) {
            setState(() {
              navPageIndex = value;
              pageController.jumpToPage(navPageIndex);
            });
          },
          selectedIconTheme:
              const IconThemeData(color: Color.fromARGB(255, 8, 7, 7)),
          items: [
            BottomNavigationBarItem(
                icon: CustomIconWidget(
                  icon: AppIcons.home,
                  color: navPageIndex == 0 ? AppColors.black : null,
                ),
                label: AppText.home),
            BottomNavigationBarItem(
              icon: CustomIconWidget(
                  icon: AppIcons.car,
                  color: navPageIndex == 1 ? AppColors.black : null),
              label: AppText.myVehicle,
            ),
            BottomNavigationBarItem(
              icon: CustomIconWidget(
                  icon: AppIcons.wallet,
                  color: navPageIndex == 2 ? AppColors.black : null),
              label: AppText.wallet,
            ),
            BottomNavigationBarItem(
              icon: CustomIconWidget(
                  icon: AppIcons.user,
                  color: navPageIndex == 3 ? AppColors.black : null),
              label: AppText.profile,
            ),
          ],
        ),
      ),
    );
  }
}
