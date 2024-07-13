import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LikeButtonWidget extends StatelessWidget {
  const LikeButtonWidget({
    super.key,
    required this.filledSvg,
    required this.unfilledSvg,
    this.onTap,
    required this.state,
  });
  final String filledSvg;
  final String unfilledSvg;
  final VoidCallback? onTap;
  final bool state;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 14,
                  spreadRadius: 24,
                  color: Color.fromRGBO(0, 0, 0, 0.02))
            ]),
        child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            child: Row(
              children: [
                state == true
                    ? SvgPicture.asset(
                        filledSvg,
                        height: 25,
                      )
                    : SvgPicture.asset(
                        unfilledSvg,
                        height: 25,
                      ),
              ],
            ),
          ),
        ));
  }
}
