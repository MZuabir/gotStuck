import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:got_stuck/screens/batteryModule/BatteryCarScreen.dart';
// import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:got_stuck/config/app_icons.dart';
// import 'package:got_stuck/config/app_images.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/config/helpers/responsive.dart';
// import 'package:got_stuck/screens/AddVehicle/addvehicleScreen.dart';
import 'package:got_stuck/widgets/RoundedButton.dart';
import 'package:got_stuck/widgets/AppText/large_text.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/CustomTitleAppBar.dart';
// import '../../widgets/RoundedTextField.dart';

class BatteryImagesScreen extends StatefulWidget {
  const BatteryImagesScreen({super.key});

  @override
  State<BatteryImagesScreen> createState() => _BatteryImagesScreenState();
}

class _BatteryImagesScreenState extends State<BatteryImagesScreen> {
  File? image;
  final _picker = ImagePicker();
  Future<void> _openImagePicker() async {
    final List<XFile> pickedImages = await _picker.pickMultiImage();
    for (XFile pickedImage in pickedImages) {
      setState(() {
        images.add(ImagesPicked(File(pickedImage.path)));
      });
    }
  }

  final List<ImagesPicked> images = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomTitleAppBar(
          backGroundColor: AppColors.white, title: AppText.battery),
      body: SafeArea(
        child: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 55),
                    child: LargeText(
                      text: AppText.batteryServiceWant,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      align: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25, top: 30, bottom: 20),
                    child: MediumText(
                      text: AppText.uploadCarImages,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: () {
                        if (images.length <= 2) {
                          _openImagePicker().then((value) {
                            if (images.length > 3) {
                              Fluttertoast.showToast(
                                  msg: 'Only three images can be used');
                            }
                          });
                        }
                      }, //images.length < 3 ? _openImagePicker : null
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        decoration: BoxDecoration(
                            color: AppColors.socialIcon,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Column(
                            children: [
                              CustomIconWidget(icon: AppIcons.uploadImage),
                              MediumText(
                                text: AppText.uploadImages,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25, top: 30, bottom: 20),
                    child: MediumText(
                      text: AppText.images,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.1,
                          crossAxisCount: 3,
                          children: List.generate(
                              images.length,
                              (index) => ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            Image.file(images[index].image),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  images.removeAt(index);
                                                });
                                              },
                                              icon: const Icon(Icons.close),
                                            ),
                                          ]),
                                    ),
                                  )),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RoundedButton(
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white),
                      text: AppText.next,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BatteryCarScreen()));
                      },
                      txtColor: AppColors.white,
                      backgroundColor: AppColors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImagesPicked {
  final File image;

  ImagesPicked(this.image);
}
