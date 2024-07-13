import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:got_stuck/config/app_icons.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/config/helpers/responsive.dart';
// import 'package:got_stuck/config/helpers/responsive.dart';
import 'package:got_stuck/screens/homeScreen/HomeScreen.dart';
import 'package:got_stuck/widgets/AppText/large_text.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/RoundedButton.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../widgets/customIconWidget.dart';
import '../../widgets/skipButton.dart';
import '../../widgets/vehicleNumberInputField.dart';
// import 'package:qrscan/qrscan.dart' as scanner;

class NumberPlateScreen extends StatefulWidget {
  const NumberPlateScreen({super.key});

  @override
  State<NumberPlateScreen> createState() => _NumberPlateScreenState();
}

class _NumberPlateScreenState extends State<NumberPlateScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Transform.translate(
                            offset: const Offset(0, -10),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: IconButton(
                                  splashRadius: 20,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const CustomIconWidget(
                                      icon: AppIcons.backArrow)),
                            ),
                          ),
                          const Expanded(
                            child: LargeText(
                              text: AppText.enterYourVehicleNumber,
                              align: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(0, -5),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SkipButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()));
                                },
                                align: TextAlign.start,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 80, right: 80, top: 10, bottom: 0),
                      child: MediumText(
                        text: AppText.enterVehicleNumber,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                        align: TextAlign.center,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: VehicleNumberInputField(controller: controller)),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 70, vertical: 30),
                      child: LargeText(
                        text: AppText.orScanyour,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                        align: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const QRScanScreen()));
                          },
                          child: SvgPicture.asset(AppIcons.scan)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: RoundedButton(
                        text: AppText.next,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        txtColor: AppColors.white,
                        backgroundColor: AppColors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({super.key});

  @override
  State<QRScanScreen> createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  String scannedCode = '';
  @override
  void dispose() {
    qrController?.dispose();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: Stack(
        children: [
          QRView(
            cameraFacing: CameraFacing.back,
            overlay: QrScannerOverlayShape(borderRadius: 20),
            key: qrKey,
            onQRViewCreated: onQrViewCreated,
          ),
          Positioned(
            top: screenHeight(context) / 5,
            left: screenWidth(context) / 4,
            right: screenWidth(context) / 4,
            child: const MediumText(
              text: 'Take a clear picture of your Car Plate Number',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white),
              align: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CustomIconWidget(
                      icon: AppIcons.backArrow, color: AppColors.white),
                ),
                const Expanded(
                  child: LargeText(
                    text: 'Add Car Plate Number by Scan Number Plate',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                    align: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          const Center(
              child: CustomIconWidget(
                  icon: 'assets/images/frame2.png', height: 250)),
        ],
      ),
    );
  }

  void onQrViewCreated(QRViewController controller) {
    var counter = 0;
    qrController = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        scannedCode = event.code!;
      });

      if (scannedCode.isNotEmpty) {
        counter++;
      }
      if (counter > 0) {
        qrController!.dispose();
        counter = 0;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false);
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const HomeScreen()));
        // scannedCode = '';
      }
      print(scannedCode.toString());
    });
  }
}
