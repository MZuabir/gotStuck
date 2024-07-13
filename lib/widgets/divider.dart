import 'package:flutter/material.dart';

import '../config/colors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          BuildDivider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'OR',
              style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  fontSize: 15),
            ),
          ),
          BuildDivider(),
        ],
      ),
    );
  }
}

Expanded BuildDivider() {
  return const Expanded(
    child: Divider(
      height: 3,
      color: AppColors.black,
    ),
  );
}
