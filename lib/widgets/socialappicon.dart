import 'package:flutter/material.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';

import '../config/colors.dart';

class SocialAppIcons extends StatelessWidget {
  final text;
  final String image;
  final VoidCallback onTap;

  const SocialAppIcons(
      {Key? key, required this.text, required this.image, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: AppColors.socialIcon,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  child: CustomIconWidget(icon: image, height: 30)),
              Text(
                text,
                style: const TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black),
              )
            ],
          ),
        ));
    // Ink(
    //   color: AppColors.socialIcon,
    //   child: ListTile(
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //     leading: CustomIconWidget(
    //       icon: image,
    //       height: 30,
    //     ),
    //     title: Text(text),
    //     onTap: onTap,
    //   ),
    // );
  }
}
