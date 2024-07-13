import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:got_stuck/config/app_icons.dart';
import 'package:got_stuck/config/app_text.dart';
import '../../widgets/CustomTitleAppBar.dart';
import '../CarousalWalletScreen/CarousalWalletScreen.dart';
import '../../config/app_images.dart';
import '../../config/colors.dart';
import '../../config/helpers/responsive.dart';
import '../../widgets/AppText/medium_text.dart';
import '../../widgets/RoundedButton.dart';
import '../../widgets/customIconWidget.dart';
import '../WalletFormScreen/WalletFormScreen.dart';
// import '../WalletFormScreen/WalletFormScreen.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key, this.isBack = false});
  final bool isBack;

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3>
    with AutomaticKeepAliveClientMixin<Screen3> {
  int currentIndex = 0;
  bool cardSelected = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomTitleAppBar(
          backGroundColor: AppColors.white,
          title: AppText.wallet,
          isBacked: widget.isBack),
      body: SafeArea(
          child: Container(
        color: AppColors.white,
        height: screenHeight(context), //- (kBottomNavigationBarHeight + 50)
        width: screenWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 20),
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.06),
                                    offset: Offset(
                                      0,
                                      4,
                                    ),
                                    blurRadius: 20,
                                    spreadRadius: 6)
                              ],
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 20, bottom: 20),
                                child: Row(
                                  children: [
                                    CustomIconWidget(icon: AppIcons.card),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: MediumText(
                                        text: AppText.creditCards,
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              CarouselSlider.builder(
                                  itemCount: 3,
                                  itemBuilder: (context, index, realIndex) {
                                    return Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              cardSelected = !cardSelected;
                                            });
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: CustomIconWidget(
                                              icon: AppImages.card,
                                              // height: 150,
                                              // width: double.infinity,
                                            ),
                                          ),
                                        ),
                                        (index == currentIndex &&
                                                cardSelected == true)
                                            ? const CustomIconWidget(
                                                icon: AppIcons.check,
                                              )
                                            : Container()
                                      ],
                                    );
                                  },
                                  options: CarouselOptions(
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        currentIndex = index;
                                        cardSelected = false;
                                      });
                                    },
                                    enlargeFactor: 0,
                                    clipBehavior: Clip.none,
                                    enableInfiniteScroll: true,
                                    scrollDirection: Axis.horizontal,
                                    autoPlay: false,
                                    // enlargeStrategy:
                                    //     CenterPageEnlargeStrategy.zoom,
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: AppColors.socialIcon,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const WalletFormScreen()));
                                    },
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 7),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              child: CustomIconWidget(
                                                  icon: AppIcons.add)),
                                          MediumText(
                                            text: AppText.addCard,
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.appYellow),
                                          )
                                        ],
                                      ),
                                    )),
                              )
                            ],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: CustomPaymentButton(
                              onTap: () {
                                Fluttertoast.showToast(msg: 'Coming soon');
                              },
                              icon: AppIcons.payPal,
                              paymentMethod: AppText.payPal,
                            ),
                          ),
                          CustomPaymentButton(
                            onTap: () {
                              Fluttertoast.showToast(msg: 'Coming soon');
                            },
                            icon: AppIcons.googleSmall,
                            paymentMethod: AppText.googlePay,
                          ),
                          CustomPaymentButton(
                            onTap: () {
                              Fluttertoast.showToast(msg: 'Coming soon');
                            },
                            icon: AppIcons.appleSmall,
                            paymentMethod: AppText.applePay,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: RoundedButton(
                                text: AppText.select,
                                onTap: () {
                                  if (cardSelected == true) {
                                    Fluttertoast.showToast(
                                        msg: 'Card selected',
                                        backgroundColor: AppColors.appYellow);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Please select card first',
                                        backgroundColor: AppColors.appYellow);
                                  }
                                },
                                txtColor: AppColors.white,
                                backgroundColor: AppColors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

//wallet balance show screen

// Scaffold(
    //     body: SafeArea(
    //   child: SizedBox(
    //     height: screenHeight(context),
    //     width: screenWidth(context),
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    //       child: Column(
    //         children: [
    //           CustomScreenNameAppBar(
    //               profileTap: () {
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) => const Screen4()));
    //               },
    //               notificationTap: () {
    //                 Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                         builder: (context) => const NotificationScreen()));
    //               },
    //               screenName: AppText.wallet,
    //               profileImage: AppImages.smallProfile),
    //           Padding(
    //               padding:
    //                   const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
    //               child: Container(
    //                   padding: const EdgeInsets.symmetric(vertical: 30),
    //                   decoration: BoxDecoration(
    //                       color: AppColors.socialIcon,
    //                       borderRadius: BorderRadius.circular(11)),
    //                   child: Column(
    //                     children: [
    //                       Row(
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           children: const [
    //                             CustomIconWidget(icon: AppIcons.walletFill),
    //                             Padding(
    //                                 padding: EdgeInsets.only(left: 10),
    //                                 child: SubTitleTextWidget(
    //                                     text: AppText.balance))
    //                           ]),
    //                       const Padding(
    //                           padding: EdgeInsets.only(top: 20),
    //                           child: LargeText(text: '£500.00')),
    //                     ],
    //                   ))),
    //           Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 20),
    //               child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     CustomWhiteButtonWidget(
    //                       icon: AppIcons.receive,
    //                       text: AppText.recieve,
    //                       onTap: () {},
    //                     ),
    //                     CustomWhiteButtonWidget(
    //                       icon: AppIcons.send,
    //                       text: AppText.send,
    //                       onTap: () {},
    //                     )
    //                   ])),
    //           Padding(
    //               padding:
    //                   const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    //               child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: const [
    //                     SubTitleTextWidget(text: AppText.walletHistory),
    //                     SubTitleTextWidget(text: AppText.price)
    //                   ])),
    //           Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 20),
    //             child: Column(
    //               children: const [
    //                 CustomWalletTiles(
    //                   icon: AppIcons.send,
    //                   title: AppText.send,
    //                   date: '13-May-2023',
    //                   amount: '£50.00',
    //                 ),
    //                 CustomWalletTiles(
    //                   icon: AppIcons.receive,
    //                   title: 'Receive',
    //                   date: '13-May-2023',
    //                   amount: '£50.00',
    //                   style: TextStyle(
    //                       fontFamily: 'Poppins',
    //                       fontSize: 14,
    //                       fontWeight: FontWeight.w700,
    //                       color: Colors.green),
    //                 )
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // ));



//wallet balance show screen end














// class CarousalWalletScreen extends StatefulWidget {
//   const CarousalWalletScreen({super.key});

//   @override
//   State<CarousalWalletScreen> createState() => _CarousalWalletScreenState();
// }

// class _CarousalWalletScreenState extends State<CarousalWalletScreen> {
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: SizedBox(
//         height: screenHeight(context),
//         width: screenWidth(context),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(children: [
//                 IconButton(
//                     splashRadius: 20,
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: const CustomIconWidget(icon: AppIcons.backArrow)),
//                 const Padding(
//                     padding: EdgeInsets.only(left: 80),
//                     child: LargeText(
//                       text: AppText.wallet,
//                       style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 24),
//                     )),
//               ]),
//             ),
//             Padding(
//                 padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
//                   decoration: BoxDecoration(
//                       boxShadow: const [
//                         BoxShadow(
//                             color: Color.fromRGBO(0, 0, 0, 0.06),
//                             offset: Offset(
//                               0,
//                               4,
//                             ),
//                             blurRadius: 20,
//                             spreadRadius: 6)
//                       ],
//                       color: AppColors.white,
//                       borderRadius: BorderRadius.circular(16)),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20, bottom: 20),
//                         child: Row(
//                           children: const [
//                             CustomIconWidget(icon: AppIcons.card),
//                             Padding(
//                               padding: EdgeInsets.only(left: 10),
//                               child: MediumText(
//                                 text: AppText.creditCards,
//                                 style: TextStyle(
//                                     fontFamily: 'Poppins',
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 150,
//                         width: 400,
//                         child: CarouselSlider.builder(
//                             itemCount: 3,
//                             itemBuilder: (context, index, realIndex) {
//                               return Stack(
//                                 alignment: Alignment.topRight,
//                                 children: [
//                                   const CustomIconWidget(
//                                     icon: AppImages.atmCard,
//                                   ),
//                                   index == currentIndex
//                                       ? const Padding(
//                                           padding: EdgeInsets.only(right: 17),
//                                           child: CustomIconWidget(
//                                             icon: AppIcons.check,
//                                             height: 5,
//                                             width: 5,
//                                           ),
//                                         )
//                                       : Container()
//                                 ],
//                               );
//                             },
//                             options: CarouselOptions(
//                               onPageChanged: (index, reason) {
//                                 setState(() {
//                                   currentIndex = index;
//                                 });
//                               },
//                               enlargeFactor: 0.3,
//                               clipBehavior: Clip.none,
//                               enableInfiniteScroll: true,
//                               enlargeCenterPage: true,
//                               scrollDirection: Axis.horizontal,
//                               autoPlay: false,
//                               enlargeStrategy: CenterPageEnlargeStrategy.zoom,
//                             )),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 10),
//                         child: TextButton(
//                             style: TextButton.styleFrom(
//                                 backgroundColor: AppColors.socialIcon,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10))),
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const WalletFormScreen()));
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 7),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: const [
//                                   Padding(
//                                       padding: EdgeInsets.only(right: 10),
//                                       child:
//                                           CustomIconWidget(icon: AppIcons.add)),
//                                   MediumText(
//                                     text: AppText.addCard,
//                                     style: TextStyle(
//                                         fontFamily: 'Poppins',
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w500,
//                                         color: AppColors.appYellow),
//                                   )
//                                 ],
//                               ),
//                             )),
//                       )
//                     ],
//                   ),
//                 )),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 children: const [
//                   Padding(
//                     padding: EdgeInsets.only(top: 10),
//                     child: CustomPaymentButton(
//                       icon: AppIcons.payPal,
//                       paymentMethod: AppText.payPal,
//                     ),
//                   ),
//                   CustomPaymentButton(
//                     icon: AppIcons.googleSmall,
//                     paymentMethod: AppText.googlePay,
//                   ),
//                   CustomPaymentButton(
//                     icon: AppIcons.appleSmall,
//                     paymentMethod: AppText.applePay,
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 10),
//                   child: RoundedButton(
//                       text: AppText.select,
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const CarWashQRScreen()));
//                       },
//                       txtColor: AppColors.white,
//                       backgroundColor: AppColors.black),
//                 ),
//               ),
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }

// class CustomPaymentButton extends StatelessWidget {
//   const CustomPaymentButton({
//     super.key,
//     required this.icon,
//     required this.paymentMethod,
//   });
//   final String icon;
//   final String paymentMethod;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: AppColors.white,
//             boxShadow: const [
//               BoxShadow(
//                   color: Color.fromRGBO(0, 0, 0, 0.06),
//                   offset: Offset(0, 4),
//                   blurRadius: 20,
//                   spreadRadius: 6)
//             ]),
//         child: TextButton(
//             style: TextButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10))),
//             onPressed: () {},
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Padding(
//                           padding: const EdgeInsets.only(right: 10, left: 15),
//                           child: CustomIconWidget(icon: icon)),
//                       MediumText(
//                         text: paymentMethod,
//                         style: const TextStyle(
//                             fontFamily: 'Poppins',
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: AppColors.black),
//                       ),
//                     ],
//                   ),
//                   const CustomIconWidget(icon: AppIcons.more)
//                 ],
//               ),
//             )),
//       ),
//     );
//   }
// }