
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:got_stuck/config/app_icons.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/config/helpers/responsive.dart';
import 'package:got_stuck/screens/CarWashModule/CarWashMainScreen.dart';
import 'package:got_stuck/widgets/MessageBubble.dart';
import 'package:got_stuck/widgets/SubTitleTextWidget.dart';
import 'package:got_stuck/widgets/TitleTextWidget.dart';
import 'package:got_stuck/widgets/customIconWidget.dart';

import '../../dataModels/ChatData.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController scrollController = ScrollController();

  TextEditingController controller = TextEditingController();

  String data = '';
  final List<ChatData> chatData = [
    ChatData('HI', true),
    ChatData('How are u', false),
    ChatData('HI', true),
    ChatData('How are u  ', false),
    ChatData('HI asjdfk ajskfj ksdjf', true),
    ChatData('How are u', false),
    ChatData('HI', true),
    ChatData('How are u sasjf jaskdjf d fasjdf adfjas fasjf ', false),
    ChatData('HI', true),
    ChatData('How are u', false),
    ChatData('HI', true),
    ChatData('How are u sasjf jaskdjf d fasjdf adfjas fasjf ', false),
    ChatData('HI asjdfk ajskfj ksdjf', true),
    ChatData('How are u', false),
    ChatData(
        'HI djfasj jdfka jsdkf asfjkasf sljfasj fasdfklsdjf asjfs fsdjf sdfjs fsdfjaskjf sdfjasfj asfas fdflasjfklasf askfa sdfaskjf sadfsjf sdfas dflkas jflasf',
        true),
    ChatData('How are u sasjf jaskdjf d fasjdf adfjas fasjf ', false),
  ];
  @override
  void initState() {
    // Call after layout is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Scroll to the bottom
      scrollController.jumpTo(scrollController.position.maxScrollExtent + 150);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(controller.text);
    print(data.toString());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.socialIcon,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon:
                            const CustomIconWidget(icon: AppIcons.backArrow))),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: const [
                    CustomIconWidget(icon: 'assets/images/avatar.png'),
                    CustomIconWidget(icon: 'assets/icons/online.svg')
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: TitleTextWidget(
                          text: 'Service Provider',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SubTitleTextWidget(text: 'Online')
                    ],
                  ),
                )
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const CustomIconWidget(
                        icon: 'assets/icons/callblack.svg')),
                IconButton(
                    onPressed: () {},
                    icon: const CustomIconWidget(
                        icon: 'assets/icons/threedot.svg')),
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
        body: SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: chatData.length,
                  itemBuilder: (context, index) {
                    return MessageBubble(
                        text: chatData[index].text,
                        isCurrentUser: chatData[index].isCurrentUser);
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25)),
                                child: TextFormField(
                                  controller: controller,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Hmm that\'s weird',
                                      hintStyle: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.txtSecondry),
                                      contentPadding:
                                          EdgeInsets.only(left: 40, right: 20)),
                                ),
                              ),
                            ),
                          ),
                          CustomIconButton(
                              color: AppColors.appYellow,
                              icon: 'assets/icons/sendBtn.svg',
                              onTap: () {
                                setState(() {
                                  if (controller.text.isNotEmpty) {
                                    setState(() {
                                      chatData
                                          .add(ChatData(controller.text, true));
                                      controller.clear();
                                      scrollController.jumpTo(scrollController
                                              .position.maxScrollExtent +
                                          80);
                                    });
                                  }
                                });
                              })
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 3),
                        child: IconButton(
                            onPressed: () {},
                            icon: const CustomIconWidget(
                              icon: 'assets/icons/emoji.svg',
                            )),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
