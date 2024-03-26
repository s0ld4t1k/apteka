// ignore_for_file: file_names, deprecated_member_use

import 'package:apte/pages/bag/bag.dart';
import 'package:apte/pages/kard/kard.dart';
import 'package:apte/pages/kategory/kategory.dart';
import 'package:apte/pages/main/mainPageWidget.dart';
import 'package:apte/pages/profile/profile.dart';
import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

ScrollController contrl = ScrollController();
var selectedTab = 0;
List bottomAppBarList = [
  'assets/icons/home.svg',
  'assets/icons/category.svg',
  'assets/icons/bag.svg',
  'assets/icons/card.svg',
  'assets/icons/profile.svg',
];
List _tabs = [
  const MainPageWidget(),
  const Kategory(),
  const Bag(),
  const Kard(),
  const Profile(),
];

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[selectedTab],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            bottomAppBarList.length,
            (index) => (index == 2)
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedTab == index) {
                          contrl.animateTo(0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                        }
                        selectedTab = index;
                      });
                    },
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(52),
                      ),
                      child: Center(
                          child: SizedBox(
                              width: 22,
                              height: 22,
                              child:
                                  SvgPicture.asset(bottomAppBarList[index]))),
                    ),
                  )
                : IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        if (selectedTab == index) {
                          contrl.animateTo(0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.linear);
                        }
                        selectedTab = index;
                      });
                    },
                    icon: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                        bottomAppBarList[index],
                        color: (selectedTab == index) ? green : tabIconGrey,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
