import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/app_icons.dart';
import 'AppText/large_text.dart';

class CustomTitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTitleAppBar({
    super.key,
    required this.backGroundColor,
    required this.title,
    this.isBacked = true,
  });
  final Color backGroundColor;
  final String title;
  final bool isBacked;
  Size get preferredSize => const Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backGroundColor,
      centerTitle: true,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: LargeText(
        text: title,
        style: const TextStyle(
            fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 24),
      ),
      leading: isBacked
          ? Padding(
              // ignore: prefer_const_constructors
              padding: EdgeInsets.only(left: 10),
              child: IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(AppIcons.backArrow)),
            )
          : const SizedBox.shrink(),
    );
  }
}
