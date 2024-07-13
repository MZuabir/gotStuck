import 'package:flutter/material.dart';

import '../config/colors.dart';
import 'AppText/large_text.dart';
import 'AppText/medium_text.dart';

class PetrolPumpDetailButton extends StatelessWidget {
  const PetrolPumpDetailButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        // width: screenWidth(context) / 1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppColors.socialIcon,
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MediumText(
                    text: 'NEAREST',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(42, 42, 42, 0.57)),
                  ),
                  LargeText(
                    text: '145.2',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins'),
                  ),
                  MediumText(
                    text: '1.2 MILES',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(42, 42, 42, 0.57)),
                  ),
                ],
              ),
            )),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset('assets/images/image.png')),
            const Expanded(
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MediumText(
                          text: 'Lowest',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(42, 42, 42, 0.57)),
                        ),
                        LargeText(
                          text: '142.9',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins'),
                        ),
                        MediumText(
                          text: '7 MILES',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(42, 42, 42, 0.57)),
                        ),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}

// Expanded(
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                
//                 ],
//               ),
//             ),

//             // height: screenHeight(context) / 5,
//             // width: screenWidth(context) / 9,
//             // padding: const EdgeInsets.all(10),
//             Padding(
//                 padding: EdgeInsets.symmetric(vertical: 20),
//                 child: Image.asset('assets/images/image.png')),
//             Container(
//                 // height: screenHeight(context) / 13.4,
//                 // width: screenWidth(context) / 4,
//                 // padding: const EdgeInsets.symmetric(horizontal: 20),
//                 // color: Colors.blue,
//                 child: Expanded(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: const [
//                     MediumText(
//                       text: 'Lowest',
//                       style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 9,
//                           fontWeight: FontWeight.w400,
//                           color: Color.fromRGBO(42, 42, 42, 0.57)),
//                     ),
//                     LargeText(
//                       text: '142.9',
//                       style: TextStyle(
//                           fontSize: 23,
//                           fontWeight: FontWeight.w700,
//                           fontFamily: 'Poppins'),
//                     ),
//                     MediumText(
//                       text: '7 MILES',
//                       style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 9,
//                           fontWeight: FontWeight.w400,
//                           color: Color.fromRGBO(42, 42, 42, 0.57)),
//                     ),
//                   ],
//                 ),
//               ),
//             ))
