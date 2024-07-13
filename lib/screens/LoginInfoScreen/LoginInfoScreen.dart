import 'dart:io';
import 'dart:math';

// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_icons.dart';
import '../../config/app_images.dart';
import '../../config/app_text.dart';
import '../../config/colors.dart';
import '../../widgets/AppText/large_text.dart';
import '../../widgets/AppText/medium_text.dart';
import '../../widgets/RoundedButton.dart';
import '../../widgets/RoundedTextField.dart';
import '../homeScreen/HomeScreen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class LoginInfoScreen extends StatefulWidget {
  const LoginInfoScreen({super.key});

  @override
  State<LoginInfoScreen> createState() => _LoginInfoScreenState();
}

class _LoginInfoScreenState extends State<LoginInfoScreen> {
  @override
  void initState() {
    getDataFromPrefs();
    super.initState();
  }

  void getDataFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      sharedPhoto = prefs.getString('photo')!;
      sharedName = prefs.getString('name')!;
      sharedMail = prefs.getString('mail')!;
      shareNumber = prefs.getString('number')!;
    });
  }

  String validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Enter email';
    } else if (!regExp.hasMatch(value)) {
      return 'Ente valid email';
    }
    return 'OK';
  }

  var myData;
  String sharedName = '';
  String sharedPhoto = '';
  String sharedMail = '';
  String shareNumber = '';
  void getData(id) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: id)
          .get();

      if (querySnapshot.docs.length > 0) {
        DocumentSnapshot snapshot = querySnapshot.docs[0];
        setState(() {
          myData = snapshot.data();
        });
      } else {
        print('Document does not exist.');
      }
    } catch (error) {
      print('Error fetching document: $error');
    }
  }

  var random = Random().nextInt(99);
  DatabaseReference ref = FirebaseDatabase.instance.ref('users');
  File? image;
  late String name;
  late String mail;
  String profileLink = '';
  String imgUrl = '';
  late String downloadedImgUrl = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  bool nameEnable = false;
  bool mailEnable = false;
  // This is the image picker
  final _picker = ImagePicker();
  bool ok = true;
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;
    // debugPrint(image.toString());
    print('share numb $shareNumber');
    debugPrint(' this is my data $myData.toString()');
    final List<dynamic>? data =
        ModalRoute.of(context)?.settings.arguments as List<dynamic>?;
    debugPrint(myData.toString());
    debugPrint(ok.toString());
    debugPrint(ok.toString());
    if (ok == true) {
      if (data != null && data.length >= 2) {
        name = data[0].toString();
        mail = data[1].toString();
        getData(mail);
        profileLink = data[2];
        if (myData != null) {
          nameController.text = myData['name'] ?? name;
          mailController.text = myData['mail'] ?? mail;
          downloadedImgUrl = myData['img'] ?? AppImages.profile;

          ok = false;
        } else {
          downloadedImgUrl = data[2];
          nameController.text = name;
          mailController.text = mail;
        }
      }
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: MediumText(text: AppText.enterYour)),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: LargeText(
                          text: AppText.personalDetails,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 26),
                        ),
                      ),
                      GestureDetector(
                        onTap: _openImagePicker,
                        child: SizedBox(
                          // color: Colors.black,
                          height: MediaQuery.of(context).size.height / 4,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Align(
                                child: Container(
                                  height: 128.32,
                                  width: 128.32,
                                  decoration: BoxDecoration(
                                      // color: AppColors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                            offset: Offset(0, 4),
                                            blurRadius: 4,
                                            spreadRadius: 0,
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.25))
                                      ],
                                      borderRadius: BorderRadius.circular(77)),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(77),
                                      child: image != null
                                          ? Image.file(image!,
                                              fit: BoxFit.cover)
                                          : downloadedImgUrl.isNotEmpty
                                              ? Image.network(downloadedImgUrl,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return const Center(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.error,
                                                            color:
                                                                AppColors.black,
                                                          ),
                                                          MediumText(
                                                            text:
                                                                'Something went wrong',
                                                            align: TextAlign
                                                                .center,
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  fit: BoxFit.cover,
                                                  loadingBuilder:
                                                      (BuildContext context,
                                                          Widget child,
                                                          ImageChunkEvent?
                                                              loadingProgress) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      return child;
                                                    }
                                                    return const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            AppColors.appYellow,
                                                      ),
                                                    );
                                                  })
                                              : Image.asset(AppImages.profile)),
                                ),
                              ),
                              Positioned(
                                top: MediaQuery.of(context).size.height /
                                    5.9, //140
                                child: Align(
                                  child: GestureDetector(
                                    onTap: _openImagePicker,
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                17,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                8,
                                        // color: Colors.black,
                                        decoration: BoxDecoration(
                                            color: AppColors.ytxtColor,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                                color: Colors.white, width: 2)),
                                        child: SvgPicture.asset(
                                          AppIcons.camera,
                                          fit: BoxFit.none,
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Rounded_text_field(
                          controller: nameController,
                          type: TextInputType.name,
                          hintText: AppText.johnWick,
                          Enabled: nameEnable,
                          onTap: () {
                            setState(() {
                              nameEnable = !nameEnable;
                            });
                          },
                        ),
                      ),
                      Rounded_text_field(
                        controller: mailController,
                        type: TextInputType.emailAddress,
                        hintText: 'abc@gmail.com',
                        Enabled: mailEnable,
                        onTap: () {
                          setState(() {
                            mailEnable = !mailEnable;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RoundedButton(
                      text: 'Save',
                      onTap: () async {
                        debugPrint(
                            'this is profile link $profileLink.toString()');
                        String validateMail =
                            validateEmail(mailController.text);
                        print('-----------------------$validateMail');
                        try {
                          if (nameController.text.isEmpty) {
                            Fluttertoast.showToast(msg: 'Enter name');
                          } else if (mailController.text.isEmpty) {
                            Fluttertoast.showToast(msg: 'Enter mail');
                          } else if (mailController.text.isNotEmpty &&
                              validateMail != 'OK') {
                            Fluttertoast.showToast(msg: 'Enter valid email');
                          } else {
                            EasyLoading.show(status: 'Please wait');
                            print('First loading enter');
                            if (myData != null ||
                                mailController.text.isNotEmpty ||
                                nameController.text.isNotEmpty) {
                              debugPrint(
                                  '------------------------------------------------------------$downloadedImgUrl');
                              if (image != null) {
                                debugPrint('in image upload');

                                Reference referenceRoot =
                                    FirebaseStorage.instance.ref();
                                Reference referenceDirImages =
                                    referenceRoot.child('images');
                                String imgName = DateTime.now()
                                    .microsecondsSinceEpoch
                                    .toString();
                                Reference referenceImageToUpload =
                                    referenceDirImages
                                        .child('GotStuck_$imgName');
                                try {
                                  await referenceImageToUpload
                                      .putFile(File(image!.path));
                                  downloadedImgUrl =
                                      await referenceImageToUpload
                                          .getDownloadURL();
                                  debugPrint(
                                      'this is downloaded url $downloadedImgUrl');
                                } catch (error) {
                                  EasyLoading.dismiss();
                                  Fluttertoast.showToast(
                                      msg: 'Something went wrong');
                                  debugPrint('error occurred: $error');
                                  FirebaseCrashlytics.instance
                                      .log('Something went wrong $e');
                                  // crashlytics.recordFlutterError(
                                  //     FlutterErrorDetails(
                                  //         exception: error,));
                                  FirebaseCrashlytics.instance.log(
                                      'this log is logged by firebase crashlytics$e');
                                  crashlytics
                                      .recordError(e, null, information: [
                                    'OTP Screen. Something went wrong'
                                        'Line number 226'
                                  ]);
                                }
                              } else {
                                debugPrint('user image url is not found');
                              }

                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString(
                                  'photo', downloadedImgUrl.toString());
                              prefs.setString('mail', mailController.text);
                              prefs.setString('name', nameController.text);
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .where('Mail',
                                      isEqualTo: mailController.text.toString())
                                  .get()
                                  .then((QuerySnapshot querySnapshot) async {
                                if (querySnapshot.docs.length > 0) {
                                  DocumentSnapshot documentSnapshot =
                                      querySnapshot.docs[0];
                                  documentSnapshot.reference.update({
                                    'Name': nameController.text.toString(),
                                    'Mail': mailController.text.toString(),
                                    'img': downloadedImgUrl,
                                  }).then((value) {
                                    EasyLoading.dismiss();

                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen()),
                                        (route) => false);
                                    FocusScope.of(context).unfocus();
                                  });
                                } else {
                                  print('New document is created');
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString(
                                      'photo', downloadedImgUrl.toString());
                                  prefs.setString('mail', mailController.text);
                                  prefs.setString('name', nameController.text);
                                  FirebaseFirestore.instance
                                      .collection('vehicles')
                                      .add({
                                    'Mail': mailController.text,
                                    'id': AppText.carNumber,
                                    'isDeleted': false,
                                    'isPressed': false,
                                    'contHeight': 172.0,
                                    'carNumber': 'BD$random SMR',
                                    'carName': AppText.carName,
                                    'motTillDate': AppText.date,
                                    'taxedTillDate': AppText.date,
                                    'primaryDate': AppText.date,
                                    'color': AppText.black,
                                    'fuelType': AppText.fuelType,
                                    'cylinder': '4',
                                    'power': AppText.powerDigits
                                  });
                                  FirebaseFirestore.instance
                                      .collection('users')
                                      .add({
                                    'Name': nameController.text.toString(),
                                    'Mail': mailController.text.toString(),
                                    'img': downloadedImgUrl.isNotEmpty
                                        ? downloadedImgUrl
                                        : profileLink
                                  }).then((value) {
                                    EasyLoading.dismiss();

                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen()),
                                        (route) => false);
                                    FocusScope.of(context).unfocus();
                                  });
                                }
                              }).catchError((error) {
                                EasyLoading.dismiss();
                                Fluttertoast.showToast(
                                    msg: 'Something went wrong');
                                print('Error updating document: $error');
                              });
                            } else {
                              if (nameController.text.isEmpty &&
                                  mailController.text.isEmpty) {
                                EasyLoading.dismiss();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please fill all fields carefully')));
                              } else {
                                EasyLoading.show(status: 'Please Wait');
                                if (image != null) {
                                  debugPrint('in image upload');

                                  Reference referenceRoot =
                                      FirebaseStorage.instance.ref();
                                  Reference referenceDirImages =
                                      referenceRoot.child('images');
                                  String imgName = DateTime.now()
                                      .microsecondsSinceEpoch
                                      .toString();
                                  Reference referenceImageToUpload =
                                      referenceDirImages
                                          .child('GotStuck_$imgName');
                                  try {
                                    await referenceImageToUpload
                                        .putFile(File(image!.path));
                                    downloadedImgUrl =
                                        await referenceImageToUpload
                                            .getDownloadURL();
                                    debugPrint(
                                        'this is downloaded url $downloadedImgUrl');
                                  } catch (error) {
                                    debugPrint('error occurred: $error');
                                  }
                                } else {
                                  debugPrint('user image url is not found');
                                }

                                debugPrint(
                                    'this is downloaded url $downloadedImgUrl');
                                FirebaseFirestore.instance
                                    .collection('vehicles')
                                    .add({
                                  'Mail': mailController.text,
                                  'id': AppText.carNumber,
                                  'isDeleted': false,
                                  'isPressed': false,
                                  'contHeight': 172.0,
                                  'carNumber': 'BD$random SMR',
                                  'carName': AppText.carName,
                                  'motTillDate': AppText.date,
                                  'taxedTillDate': AppText.date,
                                  'primaryDate': AppText.date,
                                  'color': AppText.black,
                                  'fuelType': AppText.fuelType,
                                  'cylinder': '4',
                                  'power': AppText.powerDigits
                                });
                              }
                            }
                          }
                        } catch (error) {
                          EasyLoading.dismiss();
                          Fluttertoast.showToast(msg: error.toString());
                        }
                      },
                      txtColor: AppColors.white,
                      backgroundColor: AppColors.black,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Functions {
  void update() {}
}
