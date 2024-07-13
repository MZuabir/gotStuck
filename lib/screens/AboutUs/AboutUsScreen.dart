import 'package:flutter/material.dart';
import 'package:got_stuck/config/colors.dart';
import '../../config/app_text.dart';

import '../../config/app_icons.dart';
import '../../widgets/CustomTitleAppBar.dart';
import '../../widgets/customIconWidget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomTitleAppBar(
            backGroundColor: AppColors.white, title: AppText.aboutUs),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomIconWidget(icon: AppIcons.gotStuck),
                        CustomIconWidget(icon: AppIcons.keepMovingYlw)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadingTextWidget(
                          text: AppText.aboutUs,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: ParagraphTextWidget(
                            text: AppText.lorem,
                            align: TextAlign.justify,
                          ),
                        ),
                        HeadingTextWidget(text: AppText.vision),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: ParagraphTextWidget(
                            text: AppText.lorem,
                            align: TextAlign.justify,
                          ),
                        ),
                        HeadingTextWidget(
                          text: AppText.mission,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: ParagraphTextWidget(
                            text: AppText.lorem,
                            align: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}

class ParagraphTextWidget extends StatelessWidget {
  const ParagraphTextWidget({
    super.key,
    required this.text,
    this.fontWeight,
    this.style,
    this.color,
    this.align,
  });
  final String text;
  final FontWeight? fontWeight;
  final TextStyle? style;
  final Color? color;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          const TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.grey),
      textAlign: align,
    );
  }
}

class HeadingTextWidget extends StatelessWidget {
  const HeadingTextWidget({
    super.key,
    required this.text,
    this.style,
    this.fontWeight,
    this.color,
    this.align,
  });
  final String text;
  final TextStyle? style;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          const TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.appYellow),
    );
  }
}
