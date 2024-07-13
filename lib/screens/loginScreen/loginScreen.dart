// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:got_stuck/config/app_icons.dart';
import 'package:got_stuck/config/app_images.dart';
import 'package:got_stuck/screens/LoginInfoScreen/LoginInfoScreen.dart';
import 'package:got_stuck/widgets/RoundedButton.dart';
import 'package:got_stuck/widgets/roundedTextInput.dart';
import 'package:got_stuck/screens/otpScreen/otpScreen.dart';
import 'package:got_stuck/widgets/AppText/large_text.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/divider.dart';
import 'package:got_stuck/widgets/socialappicon.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// import 'package:phone_form_field/phone_form_field.dart';
// import 'package:url_launcher/url_launcher.dart';

import '../../config/app_text.dart';
import '../../config/colors.dart';
import '../../config/helpers/responsive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;
  final Uri url1 = Uri.parse(AppText.appleURL);
  final Uri url2 = Uri.parse(AppText.facebookURL);
  final Uri url3 = Uri.parse(AppText.googleURL);
  bool? val = false;
  String phone = '';
  var myData;

  TextEditingController controller = TextEditingController();

  String validateMobile(String value) {
    String pattern = r'^(03[0-9]{9})$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return AppText.enterMobileNumber;
    } else if (!regExp.hasMatch(value)) {
      return AppText.enterValidMobileNumber;
    }
    return 'OK';
  }

  bool someIssue = false;
  int seconds = 10;
  Timer? timer;
  String downloadedImgUrl = '';
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (seconds < 1) {
            timer.cancel();
          } else {
            seconds = seconds - 1;
          }
        },
      ),
    );
  }

  String countryCode = '+92';
  String phoneNumber = '';
  static String verify = '';
  bool isloading = false;
  bool btnclick = false;

  Future<void> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    // DatabaseReference reference = FirebaseDatabase.instance.ref('users');

    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    if (googleUser.photoUrl != null) {
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('images');
      String imgName = DateTime.now().microsecondsSinceEpoch.toString();
      Reference referenceImageToUpload = referenceDirImages.child(imgName);
      try {
        http.Response response =
            await http.get(Uri.parse(googleUser.photoUrl!));
        List<int> imageData = response.bodyBytes;
        Uint8List uint8listData = Uint8List.fromList(imageData);
        await referenceImageToUpload.putData(uint8listData);
        downloadedImgUrl = await referenceImageToUpload.getDownloadURL();
        debugPrint('this is downloaded url $downloadedImgUrl');
      } catch (error) {
        debugPrint('error occured ${error}');
      }
    } else {
      debugPrint('user image url is not found');
    }

    final userCredential =
        await auth.signInWithCredential(credential).then((value) async {
      setState(() {
        isloading = false;
        EasyLoading.dismiss();
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('photo', downloadedImgUrl);
      prefs.setString('mail', auth.currentUser?.email ?? '');
      prefs.setString('name', auth.currentUser?.phoneNumber ?? '');
      debugPrint(googleUser.toString());

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => const LoginInfoScreen(),
              settings: RouteSettings(
                arguments: [
                  googleUser.displayName,
                  googleUser.email,
                  downloadedImgUrl
                ],
              )),
          (route) => false);
    }).onError(
      (error, stackTrace) {
        debugPrint(error.toString());
      },
    );
    debugPrint(userCredential);
    // if (googleUser != null) {
    //   final String name = googleUser.displayName ?? '';
    //   final String mail = googleUser.email;
    //   final String image = googleUser.photoUrl ?? '';
    // }
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.initState();
  }

  @override
  void dispose() {
    btnclick = false;
    isloading = false;
    EasyLoading.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: screenHeight(context) / 1.9,
              decoration: const BoxDecoration(
                // color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(
                    AppImages.appBackground,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SafeArea(
                top: true,
                child: SingleChildScrollView(
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(top: 50),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 25),
                              child: SvgPicture.asset(AppIcons.gotStuck),
                            )),
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: MediumText(
                              text: AppText.enterYour,
                            ),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: LargeText(
                              text: AppText.mobileNumber,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: RoundedInputField(
                            cursorColor: AppColors.appYellow,
                            onChanged: (value) {
                              phoneNumber = value;
                              phoneNumber = countryCode + phoneNumber;
                            },
                            inputType: TextInputType.number,
                            fieldColor: AppColors.white,
                            hintTextColor: AppColors.subTitle,
                            hintText: AppText.phoneNumber,
                            controllerData: controller,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Checkbox(
                                activeColor: AppColors.black,

                                fillColor: MaterialStateProperty.all<Color>(
                                    Colors.black),
                                // focusColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),

                                value: val,
                                onChanged: (value) {
                                  setState(() {
                                    val = value;
                                  });
                                },
                              ),
                            ),
                            const MediumText(
                              text: AppText.agree,
                              style: TextStyle(
                                // decoration: TextDecoration.underline,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            const MediumText(
                              text: AppText.termsConditions,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        RoundedButton(
                            text: AppText.Continue,
                            backgroundColor: AppColors.black,
                            txtColor: AppColors.white,
                            onTap: () async {
                              String? validationMessage =
                                  validateMobile(controller.text);
                              try {
                                if (validationMessage == 'OK' && val == true) {
                                  EasyLoading.show();

                                  await Firebase.initializeApp();

                                  await FirebaseAuth.instance
                                      .verifyPhoneNumber(
                                        phoneNumber: phoneNumber,
                                        verificationCompleted:
                                            (PhoneAuthCredential credential) {},
                                        verificationFailed:
                                            (FirebaseAuthException e) {
                                          EasyLoading.dismiss();
                                          if (e.toString().contains(
                                              'network-request-failed')) {
                                            EasyLoading.dismiss();
                                            Fluttertoast.showToast(
                                                msg: 'No Internet');
                                            FirebaseCrashlytics.instance.log(
                                                'this is logged by firebaseCrashlytics $e');
                                            crashlytics.recordError(
                                                fatal: true,
                                                e.toString(),
                                                StackTrace.current,
                                                information: [
                                                  'Login in Screen. when there is no internet on OTP',
                                                  'line number 320'
                                                ]);
                                          } else {
                                            EasyLoading.dismiss();
                                            Fluttertoast.showToast(
                                                msg: 'Something went wrong');
                                          }
                                        },
                                        codeSent: (String verificationId,
                                            int? resendToken) {
                                          verify = verificationId;
                                          EasyLoading.dismiss();

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OTPScreen(
                                                          phoneNumber:
                                                              phoneNumber,
                                                          verify: verify)));
                                        },
                                        codeAutoRetrievalTimeout:
                                            (String verificationId) {
                                          // EasyLoading.dismiss();
                                          // Fluttertoast.showToast(
                                          //     msg: 'Timed out');
                                        },
                                      )
                                      .then((value) {});
                                } else if (validationMessage != 'OK') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(validationMessage)));
                                } else if (val == false) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text(AppText.termsConditions)));
                                }
                              } catch (error) {
                                if (error
                                    .toString()
                                    .contains('network_error')) {
                                  FirebaseCrashlytics.instance.log(
                                      'this is logged by firebaseCrashlytics $error');
                                  crashlytics.recordError(
                                      error.toString(), StackTrace.current,
                                      information: [
                                        'Login in Screen. when there is no internet on OTP'
                                      ]);
                                  EasyLoading.dismiss();
                                  Fluttertoast.showToast(msg: 'No Internet');
                                } else {
                                  EasyLoading.dismiss();
                                  crashlytics.recordError(error, null,
                                      information: [
                                        'Login in Screen. When try to login from otp'
                                      ]);
                                  Fluttertoast.showToast(
                                      msg: 'Something went wrong');
                                }
                              }
                            }),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: OrDivider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              SocialAppIcons(
                                  text: AppText.apple,
                                  image: AppImages.apple,
                                  onTap: () {
                                    btnclick = true;
                                    // setState(() {
                                    //   launchUrl(url2);
                                    // });
                                  }),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: SocialAppIcons(
                                    text: AppText.facebook,
                                    image: AppImages.facebook,
                                    onTap: () {
                                      isloading = true;
                                      btnclick = true;
                                      // setState(() {
                                      //   launchUrl(url2);
                                      // });
                                    }),
                              ),
                              SocialAppIcons(
                                text: AppText.google,
                                image: AppImages.google,
                                onTap: () async {
                                  btnclick = true;
                                  setState(() {
                                    isloading = true;
                                  });
                                  if (btnclick == true && isloading == true) {
                                    EasyLoading.show(status: 'Loading');
                                  }
                                  try {
                                    await signInWithGoogle();
                                  } catch (error) {
                                    EasyLoading.dismiss();
                                    debugPrint(
                                        "ERROR==============>  ${error.toString()}");
                                    if (error
                                        .toString()
                                        .contains('network_error')) {
                                      log('there is no internet $error');
                                      // crashlytics.recordFlutterError(
                                      //     FlutterErrorDetails(
                                      //         exception: error,));
                                      FirebaseCrashlytics.instance.log(
                                          'this log is logged by firebase crashlytics$error');
                                      crashlytics.recordError(error, null,
                                          information: [
                                            'Login in Screen. when there is no internet while login through google'
                                                'Line number 442'
                                          ]);
                                      EasyLoading.dismiss(); 
                                      Fluttertoast.showToast(
                                          msg: 'No Internet');
                                    }
                                    setState(() {
                                      isloading = false;
                                    });
                                  }
                                },
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(top: 20, left: 0, right: 0),
                                child: MediumText(
                                  text: AppText.byProceedingYou,
                                  style: TextStyle(
                                      fontFamily: 'Manrope',
                                      color: AppColors.txtSecondry,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12),
                                  align: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
