import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:got_stuck/config/app_icons.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/screens/AboutUs/AboutUsScreen.dart';
import 'package:got_stuck/screens/HistoryModule/HistoryScreen.dart';
import 'package:got_stuck/screens/NotificationScreen/NotificationScreen.dart';
import 'package:got_stuck/screens/PersonalDetailsScreen/personalDetails.dart';
import 'package:got_stuck/screens/ReferScreen/ReferScreen.dart';
import 'package:got_stuck/screens/VoucherScreen/VoucherScreen.dart';
import 'package:got_stuck/screens/homeScreen/Screen2.dart';
import 'package:got_stuck/screens/homeScreen/Screen3.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/RoundedButton.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../loginScreen/loginScreen.dart';
import '../../config/app_images.dart';
import '../../config/helpers/responsive.dart';
import '../../widgets/AppText/large_text.dart';
import '../../widgets/ProfileFieldsWidget.dart';
import '../../widgets/SubTitleTextWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key, this.isBack = false});
  final bool isBack;

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  String name = '';
  String mail = '';
  String profile = '';
  String prefmail = '';
  String prefName = '';
  DataBaseService service = DataBaseService();
  Stream<List<Map<String, String>>>? userData;
  Future<void> logout() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  // Future<void> retrieveUserData() async {
  //   userData = service.fetchUserStream(mail: 'mianzubairryk440@gmail.com');
  //   debugPrint('this is mail  $prefmail');
  //   debugPrint(userData!.first.toString());
  // }

  @override
  void initState() {
    getInfo();
    getProfile();
    // retrieveUserData();
    super.initState();
  }

  void getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      profile = prefs.getString('photo')!;
      prefName = prefs.getString('name')!;
      prefmail = prefs.getString('mail')!;
      print(profile.toString());
      print(prefName.toString());
      print(prefmail.toString());
    });
  }

  void getInfo() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    mail = auth.currentUser!.email.toString();
    name = auth.currentUser!.displayName.toString();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(profile);
    return Scaffold(
      body: SizedBox(
        height: screenHeight(context), //- 70
        width: screenWidth(context),
        child: Stack(
          children: [
            Container(
              height: screenHeight(context) / 1.7,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.appBackground),
                      fit: BoxFit.cover)),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.isBack
                          ? GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const CustomIconWidget(
                                  icon: AppIcons.backArrow))
                          : const SizedBox.shrink(),
                      const Align(
                        alignment: Alignment.topCenter,
                        child: LargeText(
                          text: AppText.profile,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 24),
                        ),
                      ),
                      StreamBuilder<List<Map<String, String>>>(
                          stream: service.fetchUserStream(mail: prefmail),
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                              var data = snapshot.data!;
                              snapshot.data!;
                              print(data);
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(77),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(77),
                                        child: data[0]['imageUrl'] != null &&
                                                data[0]['imageUrl']!.isNotEmpty
                                            ? CachedNetworkImage(
                                                imageUrl: data[0]['imageUrl']!,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    const SizedBox(
                                                  height: 100,
                                                  width: 100,
                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                            color: AppColors
                                                                .appYellow),
                                                  ),
                                                ),
                                                errorWidget: (context, url,
                                                        error) =>
                                                    Container(
                                                        height: 100,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 0.1,
                                                                color: AppColors
                                                                    .white),
                                                            borderRadius:
                                                                const BorderRadius.all(
                                                                    Radius.circular(
                                                                        77))),
                                                        child: const Center(
                                                            child: Icon(
                                                                Icons.error))),
                                              )
                                            : Image.asset(
                                                AppImages.profile,
                                                fit: BoxFit.contain,
                                              ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            LargeText(
                                              text: data[0]['Name']!,
                                              style: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 22),
                                            ),
                                            SubTitleTextWidget(
                                              text: prefmail.isEmpty
                                                  ? AppText.gmail
                                                  : prefmail,
                                              style: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            } else if (snapshot.connectionState ==
                                    ConnectionState.waiting &&
                                (snapshot.data == null ||
                                    snapshot.data!.isNotEmpty)) {
                              return const Center(
                                child: CircularProgressIndicator(
                                    color: AppColors.appYellow),
                              );
                            } else {
                              return const Center(child: Text('No Data'));
                            }
                          }),
                      ProfileFieldsWidget(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PersonalDetailsScreen()));
                          },
                          text: AppText.editProfile),
                      const CustomDividerWidget(),
                      ProfileFieldsWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Screen3(
                                        isBack: true,
                                      )));
                        },
                        text: AppText.payment,
                      ),
                      const CustomDividerWidget(),
                      ProfileFieldsWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HistoryScreen()));
                        },
                        text: AppText.history,
                      ),
                      const CustomDividerWidget(),
                      ProfileFieldsWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const VoucherScreen()));
                        },
                        text: AppText.myVoucher,
                      ),
                      const CustomDividerWidget(),
                      ProfileFieldsWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ReferScreen()));
                        },
                        text: AppText.referToFriend,
                      ),
                      const CustomDividerWidget(),
                      ProfileFieldsWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AboutUsScreen()));
                        },
                        text: 'About us',
                      ),
                      const CustomDividerWidget(),
                      ProfileFieldsWidget(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationScreen()));
                        },
                        text: AppText.notification,
                      ),
                      const CustomDividerWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: const Text(AppText.logOut),
                          trailing:
                              const CustomIconWidget(icon: AppIcons.logOut),
                          onTap: () {
                            showModalBottomSheet(
                              enableDrag: true,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: SizedBox(
                                      height: 350,
                                      child: Column(
                                        children: [
                                          const CustomIconWidget(
                                              icon: AppIcons.rectangle),
                                          const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 40, bottom: 30),
                                              child: MediumText(
                                                  text: AppText.logOut,
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500))),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 80),
                                            child: MediumText(
                                              text: AppText.areYouWant,
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromRGBO(
                                                    149,
                                                    152,
                                                    157,
                                                    1,
                                                  )),
                                              align: TextAlign.center,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 40),
                                              child: Column(
                                                children: [
                                                  RoundedButton(
                                                      text: AppText.yes,
                                                      onTap: () async {
                                                        SharedPreferences
                                                            prefs =
                                                            await SharedPreferences
                                                                .getInstance();
                                                        prefs.remove('photo');
                                                        prefs.remove('name');
                                                        prefs.remove('mail');

                                                        logout();
                                                        Navigator.of(context)
                                                            .pushAndRemoveUntil(
                                                          MaterialPageRoute(
                                                            fullscreenDialog:
                                                                false,
                                                            builder: (BuildContext
                                                                    context) =>
                                                                const LoginScreen(),
                                                          ),
                                                          (Route<dynamic>
                                                                  route) =>
                                                              false,
                                                        );
                                                      },
                                                      txtColor: AppColors.white,
                                                      backgroundColor:
                                                          const Color.fromRGBO(
                                                              244, 183, 51, 1)),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: RoundedButton(
                                                        text: AppText.no,
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        txtColor:
                                                            AppColors.white,
                                                        backgroundColor:
                                                            AppColors.black),
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
                              },
                            );
                          },
                        ),
                      )
                    ],
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

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color.fromRGBO(39, 37, 37, 0.05),
      height: 2,
      thickness: 2,
    );
  }
}
