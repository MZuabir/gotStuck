// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:got_stuck/config/colors.dart';

class CustomTabBar extends StatefulWidget {
  final String firstTitle, secondTitle;
  final List<Widget> children;
  final List<String> tabs;
  final Border? border;
  final bool? isBorder;
  final int index;

  const CustomTabBar({
    Key? key,
    required this.secondTitle,
    required this.children,
    required this.tabs,
    this.border,
    this.isBorder = false,
    required this.index,
    required this.firstTitle,
  }) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int val = 0;
  int selectedIndex = 1;
  bool? isActive;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 60,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(
                50.0,
              ),
              border: Border.all(color: AppColors.tabBorderColor, width: 2),
            ),
            child: TabBar(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppColors.appYellow,
              dividerColor: Colors.transparent,
              indicatorWeight: 0.0,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.black,
              ),
              labelColor: AppColors.white,
              unselectedLabelColor: AppColors.unselectedBtnColor,
              tabs: widget.tabs.map((item) {
                isActive = widget.tabs.indexOf(item) == selectedIndex;
                return Tab(
                  child: Text(
                    item,
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: widget.children,
            ),
          ),
        ),
      ],
    );
  }
}
