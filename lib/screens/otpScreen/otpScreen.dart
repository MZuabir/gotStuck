import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:got_stuck/config/app_icons.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/helpers/responsive.dart';
import 'package:got_stuck/screens/LoginInfoScreen/LoginInfoScreen.dart';
import 'package:got_stuck/widgets/RoundedButton.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';
// import 'package:pinput/pinput.dart';

import '../../config/app_images.dart';
import '../../config/colors.dart';
import '../../widgets/AppText/large_text.dart';
import '../../widgets/AppText/medium_text.dart';
import '../../widgets/OtpInputField.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  final String verify;
  OTPScreen({
    Key? key,
    required this.phoneNumber,
    required this.verify,
  }) : super(key: key);

  @override
  _OTPScreen createState() => _OTPScreen();
}

class _OTPScreen extends State<OTPScreen> {
  final FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;
  TextEditingController otpTxt = TextEditingController();
  bool isSent = false;
  int _seconds = 59;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_seconds < 1) {
            timer.cancel();
          } else {
            _seconds = _seconds - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    isSent = false;
    super.dispose();
  }

  var code = '';

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    debugPrint(widget.verify.toString());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          child: Stack(
            children: [
              Container(
                height: screenHeight(context) / 1.8,
                width: double.infinity,
                decoration: const BoxDecoration(
                  // color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage(AppImages.appBackground),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(top: 40, left: 10),
                        child: IconButton(
                          splashRadius: 20,
                          icon: const CustomIconWidget(
                            icon: AppIcons.backArrow,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 90, top: 40, bottom: 30),
                    child: SvgPicture.asset(
                      AppIcons.gotStuck,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LargeText(text: AppText.otp),
                        const MediumText(
                          text: AppText.pleaseEnter,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const MediumText(text: AppText.receivedAt),
                            MediumText(
                              text: widget.phoneNumber.toString(),
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 40, bottom: 20),
                    child: SizedBox(
                      width: double.infinity,
                      // height: 55,
                      child: OtpInputField(
                        otpTxt: otpTxt,
                        onChanged: (value) {
                          code = value;
                        },
                      ),
                    ),
                  ),
                  // const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _seconds > 0 ? '00:$_seconds' : '00:00',
                          style: const TextStyle(
                              color: AppColors.ytxtColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  RoundedButton(
                      text: AppText.confirm,
                      backgroundColor: AppColors.black,
                      txtColor: AppColors.white,
                      onTap: () async {
                        startTimer();
                        // if (otpTxt.text.isNotEmpty) {
                        EasyLoading.show();
                        setState(() {});
                        try {
                          PhoneAuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: widget.verify,
                                  smsCode: otpTxt.text.toString());

                          // Sign the user in (or link) with the credential
                          await auth
                              .signInWithCredential(credential)
                              .then((value) {
                            isSent = true;
                            EasyLoading.dismiss();

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LoginInfoScreen()),
                                (route) => false);
                          });

                          if (isSent == false && _seconds == 1) {
                            EasyLoading.dismiss();
                            Fluttertoast.showToast(msg: 'Something went wrong');
                          }
                        } catch (e) {
                          FirebaseCrashlytics.instance
                              .log('Something went wrong $e');
                          // crashlytics.recordFlutterError(
                          //     FlutterErrorDetails(
                          //         exception: error,));
                          FirebaseCrashlytics.instance.log(
                              'this log is logged by firebase crashlytics$e');
                          crashlytics.recordError(e, null, information: [
                            'OTP Screen. Something went wrong'
                                'Line number 226'
                          ]);
                          EasyLoading.dismiss();
                          Fluttertoast.showToast(msg: 'Something went wrong');
                          print('this is error $e');
                        }

                        // }
                        // else {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text(AppText.enterOtp)));
                        // }
                        otpTxt.clear();
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: RoundedButton(
                        text: AppText.resend,
                        onTap: () {
                          if (_seconds == 0) {
                            setState(() {
                              _seconds = 59;
                              startTimer();
                              print(_seconds);
                            });
                          }
                        },
                        txtColor: AppColors.resendBtn,
                        backgroundColor: AppColors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
