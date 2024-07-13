import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:got_stuck/config/app_icons.dart';
import 'package:got_stuck/config/app_images.dart';
import 'package:got_stuck/screens/onBoardScreen/new.dart';

import '../../config/app_text.dart';
import '../../config/colors.dart';

// import '../loginScreen/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  timer() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const OnBoardNew()),
      (route) => false,
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      timer();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.68,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.splshback1),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Transform.scale(
                    scale: 0.9,
                    child: SvgPicture.asset(
                      AppIcons.splashGotStuck,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.49,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.splashback2),
                fit: BoxFit.cover,
              ),
            ),
            child: const Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Text(
                      AppText.keepMoving,
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 25,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
