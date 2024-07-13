import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:got_stuck/config/app_images.dart';
import 'package:got_stuck/screens/homeScreen/Screen2.dart';
import '../config/app_icons.dart';
import '../config/colors.dart';

class CustomAppBar extends StatelessWidget {
  final String mail;
  final VoidCallback? notificationTap;
  final VoidCallback? profileTap;
  final String? screenName;
  CustomAppBar({
    Key? key,
    required this.mail,
    this.notificationTap,
    this.profileTap,
    this.screenName,
  }) : super(key: key);

  get pageIndex => null;
  DataBaseService service = DataBaseService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: profileTap,
            child: StreamBuilder<List<Map<String, String>>>(
                stream: service.fetchUserStream(mail: mail),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    var data = snapshot.data!;
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(26),
                        child: Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            // color: Colors.green,
                          ),
                          child: data[0]['imageUrl'] != null &&
                                  data[0]['imageUrl']!.isNotEmpty
                              ? CachedNetworkImage(
                                  imageUrl: data[0]['imageUrl']!,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const SizedBox(
                                    height: 52,
                                    width: 52,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                          strokeWidth: 1,
                                          color: AppColors.appYellow),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                )
                              : Image.asset(
                                  AppImages.profile,
                                  fit: BoxFit.contain,
                                ),
                        ));
                  } else if (snapshot.connectionState ==
                          ConnectionState.waiting &&
                      (snapshot.data == null || snapshot.data!.isNotEmpty)) {
                    return const Center(
                      child: CircularProgressIndicator(
                          strokeWidth: 1, color: AppColors.appYellow),
                    );
                  } else {
                    return const Center(child: Text('No Data'));
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0, top: 10),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  AppIcons.gotStuck,
                  height: 25,
                )),
          ),
          GestureDetector(
            onTap: notificationTap,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.socialIcon,
                ),
                child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: SvgPicture.asset('assets/icons/bell.svg'))),
          )
        ],
      ),
    );
  }
}
