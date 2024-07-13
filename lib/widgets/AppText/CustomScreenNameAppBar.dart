import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:got_stuck/widgets/AppText/large_text.dart';

import '../../config/colors.dart';

class CustomScreenNameAppBar extends StatelessWidget {
  const CustomScreenNameAppBar(
      {super.key,
      required this.profileTap,
      required this.notificationTap,
      required this.screenName,
      required this.profileImage});
  final VoidCallback profileTap;
  final VoidCallback notificationTap;
  final String screenName;
  final String profileImage;

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
            child: Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                // color: Colors.green,
              ),
              child: Image.asset(
                profileImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0, top: 10),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: LargeText(text: screenName)),
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
