import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:got_stuck/config/app_text.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';
import '../../config/app_images.dart';
import '../../config/app_icons.dart';
import '../../widgets/SubTitleTextWidget.dart';
import '../../widgets/TitleTextWidget.dart';

class ChatPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<Message> messages = [
    const Message(text: "Hi there!", isSender: false),
    const Message(text: "Hello!", isSender: true),
    const Message(text: "How are you?", isSender: true),
    const Message(text: "I'm fine, thanks. How about you?", isSender: false),
    const Message(text: "Hi there!", isSender: false),
    const Message(text: "Hello!", isSender: true),
    const Message(text: "How are you?", isSender: true),
    const Message(text: "I'm fine, thanks. How about you?", isSender: false),
    const Message(text: "Hi there!", isSender: false),
    const Message(text: "Hello!", isSender: true),
    const Message(text: "How are you?", isSender: true),
    const Message(text: "I'm fine, thanks. How about you?", isSender: false),
  ];

  void _addMessage(String text, bool isSender) {
    setState(() {
      messages.add(Message(text: text, isSender: isSender));
    });
  }

  void _handleSubmit(String text) {
    if (text.isEmpty) {
      return;
    }
    _addMessage(text, true);
    _textEditingController.clear();
  }

  Widget buildMessage(Message message) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          if (!message.isSender)
            const CustomOnlineStatusWidget(
                isOnline: true, profile: AppImages.sender),
          const SizedBox(width: 10),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(right: message.isSender ? 10 : 0),
              child: Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  margin: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 5.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(24),
                        bottomLeft: Radius.circular(message.isSender ? 24 : 0),
                        topRight: const Radius.circular(24),
                        bottomRight:
                            Radius.circular(message.isSender ? 0 : 24)),
                    color: message.isSender
                        ? AppColors.white
                        : AppColors.appYellow,
                  ),
                  child: MediumText(
                    text: message.text,
                  )),
            ),
          ),
          if (message.isSender)
            const CustomOnlineStatusWidget(
                isOnline: true, profile: AppImages.receiver),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.socialIcon,
        appBar: AppBar(
          centerTitle: true,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,

          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: FittedBox(
              child: IconButton(
                  splashRadius: 1,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(AppIcons.backArrow)),
            ),
          ),

          title: const Row(
            children: [
              CustomOnlineStatusWidget(
                  isOnline: true, profile: AppImages.avatar, height: 50),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: TitleTextWidget(
                          text: AppText.serviceProvider,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SubTitleTextWidget(text: AppText.online)
                    ],
                  ),
                ),
              )
            ],
          ),
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Fluttertoast.showToast(msg: 'Coming soon');
                    },
                    icon: const CustomIconWidget(icon: AppIcons.callBlack)),
                IconButton(
                    onPressed: () {
                      Fluttertoast.showToast(msg: 'Coming soon');
                    },
                    icon: const CustomIconWidget(icon: AppIcons.threeDot)),
              ],
            )
          ],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          toolbarHeight: 80,
          // elevation: 1,
          backgroundColor: AppColors.white,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return ListView.builder(
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final message = messages[messages.length - index - 1];
                      return buildMessage(message);
                    },
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        child: Stack(
                          children: [
                            TextField(
                              controller: _textEditingController,
                              textInputAction: TextInputAction.send,
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 50, right: 20),
                                  hintText: AppText.hmmThatsWeired,
                                  border: InputBorder.none),
                              onSubmitted: _handleSubmit,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon:
                                  const CustomIconWidget(icon: AppIcons.emoji),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: AppColors.appYellow),
                    icon: const CustomIconWidget(icon: AppIcons.sendBtn),
                    onPressed: () => _handleSubmit(_textEditingController.text),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomOnlineStatusWidget extends StatelessWidget {
  const CustomOnlineStatusWidget({
    super.key,
    required this.isOnline,
    required this.profile,
    this.height,
  });
  final bool isOnline;
  final String profile;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CustomIconWidget(
          icon: profile,
          height: height ?? 40,
        ),
        isOnline ? const CustomIconWidget(icon: AppIcons.online) : Container(),
      ],
    );
  }
}

class Message {
  final String text;
  final bool isSender;

  const Message({
    required this.text,
    required this.isSender,
  });
}
