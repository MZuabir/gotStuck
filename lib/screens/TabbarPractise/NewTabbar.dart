import 'package:flutter/material.dart';
// import 'package:got_stuck/config/app_icons.dart';
import 'package:got_stuck/config/colors.dart';
import 'package:got_stuck/widgets/AppText/medium_text.dart';
// import 'package:got_stuck/widgets/customIconWidget.dart';
// import 'package:get/get.dart';

// class AnimatedToggle extends StatefulWidget {
//   final List<String> values;
//   final ValueChanged onToggleCallback;
//   final Color backgroundColor;
//   final Color buttonColor;
//   final Color textColor;

//   const AnimatedToggle({
//     required this.values,
//     required this.onToggleCallback,
//     this.backgroundColor = AppColors.white, //const Color(0xFFe7e7e8)
//     this.buttonColor = AppColors.black,
//     this.textColor = AppColors.black,
//   });
//   @override
//   _AnimatedToggleState createState() => _AnimatedToggleState();
// }

// class _AnimatedToggleState extends State<AnimatedToggle> {
//   bool initialPosition = true;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25),
//             border: Border.all(color: AppColors.tabBorderColor, width: 2)),
//         width: double.infinity,
//         height: 57,
//         child: Stack(
//           children: <Widget>[
//             GestureDetector(
//               onTap: () {
//                 initialPosition = !initialPosition;
//                 var index = 0;
//                 if (!initialPosition) {
//                   index = 1;
//                 }
//                 widget.onToggleCallback(index);
//                 setState(() {});
//               },
//               child: Container(
//                 width: double.infinity,
//                 height: 57,
//                 decoration: ShapeDecoration(
//                   color: AppColors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: List.generate(
//                     widget.values.length,
//                     (index) => Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 30),
//                       child: Text(
//                         widget.values[index],
//                         style: const TextStyle(
//                             fontFamily: 'Poppins',
//                             fontWeight: FontWeight.w700,
//                             fontSize: 12),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             AnimatedAlign(
//               duration: const Duration(milliseconds: 250),
//               curve: Curves.decelerate,
//               alignment: initialPosition
//                   ? Alignment.centerLeft
//                   : Alignment.centerRight,
//               child: Container(
//                 width: 173,
//                 height: 49,
//                 decoration: ShapeDecoration(
//                   color: initialPosition ? AppColors.black : AppColors.grey,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 alignment: Alignment.center,
//                 child: Text(
//                   initialPosition ? widget.values[0] : widget.values[1],
//                   style: TextStyle(
//                     fontFamily: 'Poppins',
//                     fontSize: 12,
//                     color: widget.textColor,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// AnimatedToggle(
//               values: ['English', 'Arabic'],
//               onToggleCallback: (value) {
//                 setState(() {
//                   _toggleValue = value;
//                 });
//               },
//               buttonColor: const Color(0xFF0A3157),
//               backgroundColor: const Color(0xFFB5C1CC),
//               textColor: const Color(0xFFFFFFFF),
//             ),

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? activeIcon, inactiveIcon;
  final String text;

  const CustomSwitch(
      {Key? key,
      required this.value,
      required this.onChanged,
      required this.text,
      this.activeIcon,
      this.inactiveIcon})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.linear),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            setState(() {
              widget.value == false
                  ? widget.onChanged(true)
                  : widget.onChanged(false);
            });
          },
          child: Container(
            width: 150,
            height: 49,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                // color: _circleAnimation!.value == Alignment.centerLeft
                //     ? AppColors.black
                //     : const Color.fromRGBO(243, 246, 248, 1),
                color: widget.value
                    ? const Color.fromRGBO(243, 246, 248, 1)
                    : AppColors.black),
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 2.0),
              child: Container(
                alignment: widget.value
                    ? ((Directionality.of(context) == TextDirection.rtl)
                        ? Alignment.centerRight
                        : Alignment.centerLeft)
                    : ((Directionality.of(context) == TextDirection.rtl)
                        ? Alignment.centerLeft
                        : Alignment.centerRight),
                child: Center(
                    child: MediumText(
                  text: widget.text,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: widget.value
                          ? const Color.fromRGBO(171, 176, 191, 1)
                          : AppColors.white),
                )),
                // child: Container(
                //   width: 30.0,
                //   height: 30.0,
                //   alignment: Alignment.center,
                //   decoration: const BoxDecoration(
                //       shape: BoxShape.circle, color: Colors.white),
                //   child: _circleAnimation!.value == Alignment.centerLeft
                //       ? CustomIconWidget(
                //           icon: widget.activeIcon ?? AppIcons.backArrow)
                //       : CustomIconWidget(
                //           icon: widget.activeIcon.toString(),
                //         ),
                // ),
              ),
            ),
          ),
        );
      },
    );
  }
}
