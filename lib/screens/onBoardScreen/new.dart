import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:got_stuck/config/app_icons.dart';
import 'package:got_stuck/dataModels/contenModel.dart';
import 'package:got_stuck/screens/loginScreen/loginScreen.dart';
import '../../config/app_images.dart';
import '../../config/app_text.dart';
import '../../config/colors.dart';
import '../../config/helpers/responsive.dart';
import '../../widgets/AppText/primary_text.dart';
import '../../widgets/RoundedButton.dart';

class OnBoardNew extends StatefulWidget {
  const OnBoardNew({super.key});
  @override
  State<OnBoardNew> createState() => _OnBoardNewState();
}

class _OnBoardNewState extends State<OnBoardNew> {
  int currentIndex = 0;
  PageController? _controller;
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Container(
            height: screenHeight(context) / 1.7,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.appBackground),
                    fit: BoxFit.cover)),
          ),
          ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return SizedBox(
                  // height: MediaQuery.of(context).size.height,
                  // width: MediaQuery.of(context).size.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding:
                                const EdgeInsets.only(top: 120, bottom: 50),
                            child: SvgPicture.asset(AppIcons.gotStuck)),
                        Image.asset(
                          contents[i].image,
                          width: currentIndex == 0
                              ? MediaQuery.of(context).size.width / 1
                              : currentIndex == 1
                                  ? MediaQuery.of(context).size.width / 1
                                  : MediaQuery.of(context).size.width / 1,
                          height: currentIndex == 0
                              ? MediaQuery.of(context).size.height / 5
                              : currentIndex == 1
                                  ? MediaQuery.of(context).size.height / 5
                                  : MediaQuery.of(context).size.height / 5,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          // height:
                          //     MediaQuery.of(context).size.height / 3.2,
                          // width: MediaQuery.of(context).size.width,
                          // color: Colors.green,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 80),
                                child: Text(
                                  AppText.tagline,
                                  style: TextStyle(
                                      color: AppColors.ytxtColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Manrope'),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                width: double.infinity,
                                child: PrimaryText(
                                  text: contents[i].text,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                );
              },
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (index) => BuildDots(index, context),
                    ).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: RoundedButton(
                      backgroundColor: AppColors.black,
                      txtColor: AppColors.white,
                      text: currentIndex == contents.length - 1
                          ? AppText.getStarted
                          : AppText.next,
                      onTap: () {
                        setState(() {
                          if (currentIndex == contents.length - 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ));
                          }
                          _controller?.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        });
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container BuildDots(int index, BuildContext context) {
    return Container(
      height: 8,
      width: currentIndex == index ? 40 : 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: currentIndex == index ? Colors.black : AppColors.dotColor,
      ),
    );
  }
}
