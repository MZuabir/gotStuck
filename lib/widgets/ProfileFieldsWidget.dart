import 'package:flutter/material.dart';
import 'customIconWidget.dart';

class ProfileFieldsWidget extends StatelessWidget {
  const ProfileFieldsWidget({
    super.key,
    required this.onTap,
    required this.text,
  });
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      title: Text(text),
      trailing: const CustomIconWidget(icon: 'assets/icons/next.svg'),
      onTap: onTap,
    );

    // GestureDetector(
    //   onTap: onTap,
    //   child: Padding(
    //     padding: const EdgeInsets.only(top: 20),
    //     child: Column(
    //       children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             MediumText(
    //                 text: text,
    //                 style: const TextStyle(
    //                     fontFamily: 'Manrope',
    //                     fontSize: 16,
    //                     fontWeight: FontWeight.w500)),
    //             const CustomIconWidget(icon: 'assets/icons/next.svg')
    //           ],
    //         ),
    //         const Padding(
    //           padding: EdgeInsets.only(top: 20),
    //           child: Divider(
    //             color: Color.fromRGBO(39, 37, 37, 0.05),
    //             height: 2,
    //             thickness: 2,
    //             // indent: 20,
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
