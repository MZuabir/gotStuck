import 'package:flutter/material.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';

import 'SubTitleTextWidget.dart';
import 'TitleTextWidget.dart';

class SingleNotificationWidget extends StatelessWidget {
  const SingleNotificationWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.timesAgo,
  });
  final String icon;
  final String title;
  final String subTitle;
  final String timesAgo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
                color: AppColors.socialIcon,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: CustomIconWidget(
                icon: icon,
                // height: 18,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleTextWidget(
                        text: title,
                        style: const TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SubTitleTextWidget(
                        text: timesAgo,
                        style: const TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(107, 114, 128, 1)),
                      )
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: SubTitleTextWidget(text: subTitle))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
