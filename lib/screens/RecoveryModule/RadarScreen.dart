import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:got_stuck/config/app_images.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/screens/RecoveryModule/RecoveryArrivalScreen.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';
import 'package:slider_button/slider_button.dart';

import '../../config/app_icons.dart';

class RadarScreen extends StatefulWidget {
  const RadarScreen({super.key});

  @override
  State<RadarScreen> createState() => _RadarScreenState();
}

class _RadarScreenState extends State<RadarScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  // late Timer timer;
  int seconds = 0;
  Timer? timer;

  void startTimer() {
    if (timer != null) {
      timer?.cancel();
    }
    seconds = 0;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
        if (seconds == 5) {
          seconds = 0;
          timer.cancel();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RecoveryArrivalScreen()));
        }
      });
    });
  }

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 20))
          ..repeat();

    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    timer?.cancel();
    seconds = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Dismissible(
          direction: DismissDirection.horizontal,
          onDismissed: (direction) {
            Navigator.of(context).pop();
          },
          key: const Key('Key'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(AppIcons.backArrow)),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomIconWidget(icon: AppIcons.gotStuck),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50, right: 50, top: 30, bottom: 10),
                        child: MediumText(
                          align: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                          text: seconds <= 2
                              ? AppText.waitingRecoveryService
                              : (seconds > 2 && seconds < 4)
                                  ? AppText.waitingForJobAccepted
                                  : AppText.jobAccepted,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 100),
                        child: MediumText(
                          text: AppText.mayTaketime,
                          align: TextAlign.center,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppImages.circles))),
                        child: RotationTransition(
                          turns:
                              Tween(begin: 0.0, end: 4.0).animate(controller),
                          child: Container(
                            width: double.infinity,
                            height: 400,
                            decoration: const BoxDecoration(
                                gradient: SweepGradient(
                              center: FractionalOffset.center,
                              colors: [
                                Colors.transparent,
                                AppColors.appYellow,
                                Colors.transparent
                              ],
                              stops: [0.20, 0.25, 0.20],
                            )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: SliderButton(
                                    buttonColor: Colors.transparent,
                                    // dismissThresholds: 5,
                                    shimmer: false,
                                    buttonSize: 60,
                                    backgroundColor: Colors.transparent,
                                    height: 60,
                                    width: 210,
                                    action: () {
                                      timer?.cancel();
                                      controller.stop();
                                      Navigator.pop(context);
                                    },
                                    label: const Text(
                                      AppText.slideToCancel,
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: AppColors.grey),
                                    ),
                                    icon: const CustomIconWidget(
                                      icon: AppIcons.slideCancel,
                                    )))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
