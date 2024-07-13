import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconWidget extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? height;
  final double? width;
  const CustomIconWidget(
      {super.key, required this.icon, this.color, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return icon.contains("svg")
        ? SvgPicture.asset(
            icon,
            color: color,
          )
        : Image.asset(
            icon,
            color: color,
            height: height,
            width: width,
          );
  }
}
