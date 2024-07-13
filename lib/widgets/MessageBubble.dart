import 'package:flutter/material.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {Key? key, required this.text, required this.isCurrentUser})
      : super(key: key);

  final String text;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        isCurrentUser ? 64.0 : 16.0,
        20,
        isCurrentUser ? 16.0 : 64.0,
        20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isCurrentUser ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (!isCurrentUser)
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: const [
                    CustomIconWidget(
                      icon: 'assets/images/sender.png',
                      height: 40,
                    ),
                    CustomIconWidget(icon: 'assets/icons/online.svg')
                  ],
                )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  right: isCurrentUser ? 0 : 60, left: isCurrentUser ? 60 : 0),
              child: Container(
                // width: 200,
                decoration: BoxDecoration(
                  color: isCurrentUser ? AppColors.white : AppColors.appYellow,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: const Radius.circular(24),
                    bottomStart: Radius.circular(isCurrentUser
                        ? 24
                        : 0), //set bottom radius based on isCurrentUser
                    topEnd: const Radius.circular(24),
                    bottomEnd:
                        Radius.circular(isCurrentUser ? 0 : 24), //same here
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: MediumText(
                    text: text,
                    //text color based on isCurrentUser
                  ),
                ),
              ),
            ),
          ),
          if (isCurrentUser)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: const [
                  CustomIconWidget(
                    icon: 'assets/images/receiver.png',
                    height: 40,
                  ),
                  CustomIconWidget(icon: 'assets/icons/online.svg')
                ],
              ),
            ),
        ],
      ),
    );
  }
}
