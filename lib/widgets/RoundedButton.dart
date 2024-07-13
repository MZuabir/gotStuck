import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color txtColor;
  final Color backgroundColor;
  final TextStyle? style;
  final double? height;
  const RoundedButton({
    Key? key,
    this.style,
    required this.text,
    required this.onTap,
    required this.txtColor,
    required this.backgroundColor,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 56,
      // width: double.,
      // color: Colors.black,

      child: Center(
          child: TextButton(
        clipBehavior: Clip.hardEdge,
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            // RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            fixedSize: MaterialStateProperty.all(Size.copy(Size(
                MediaQuery.of(context).size.width / 1.12,
                MediaQuery.of(context).size.height / 14))),
            backgroundColor: MaterialStateProperty.all(backgroundColor)),
        onPressed: onTap,
        child: Text(
          text,
          style: style ??
              TextStyle(
                  color: txtColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  fontFamily: 'Poppins'),
        ),
      )),
    );
  }
}
