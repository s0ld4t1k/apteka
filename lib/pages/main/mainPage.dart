// ignore_for_file: file_names, deprecated_member_use

import 'package:apte/data/dio.dart';
import 'package:apte/data/model/cart/controller.dart';
import 'package:apte/data/model/user/controller.dart';
import 'package:apte/main.dart';
import 'package:apte/pages/bag/bag.dart';
import 'package:apte/pages/kard/kard.dart';
import 'package:apte/pages/kategory/kategory.dart';
import 'package:apte/pages/main/mainPageWidget.dart';
import 'package:apte/pages/profile/profile.dart';
import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

ScrollController contrl = ScrollController();
var selectedTab = 0;
List bottomAppBarList = [
  'assets/icons/home.svg',
  // 'assets/icons/category.svg',
  'assets/icons/bag.svg',
  // 'assets/icons/card.svg',
  'assets/icons/profile.svg',
];
List _tabs = [
  const MainPageWidget(),
  // const Kategory(),
  const Bag(),
  // const Kard(),
  const Profile(),
];

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    if (tokenn.isNotEmpty && !JwtDecoder.isExpired(tokenn)) {
      Get.put(CartController());
      Get.delete<CartController>();
      Get.put(UserController());
      Get.delete<UserController>();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          child: _tabs[selectedTab],
          onRefresh: () async {
            Get.offAll(() => const MainPage());
          }),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: List.generate(
            bottomAppBarList.length,
            (index) => (index == 1)
                ? Expanded(
                    child: InkWell(
                      onTap: () {
                        if (Dioo().checkToken()) {
                          setState(() {
                            if (selectedTab == index) {
                              contrl.animateTo(0,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            }
                            selectedTab = index;
                          });
                        }
                      },
                      child: Obx(() => Container(
                            alignment: Alignment.center,
                            child: Badge(
                              label:
                                  Text('${harytJemi.value + eltipberme.value}'),
                              isLabelVisible: harytJemi.value > 0,
                              backgroundColor: red,
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
                                        child: SvgPicture.asset(
                                            bottomAppBarList[index]))),
                              ),
                            ),
                          )),
                    ),
                  )
                : Expanded(
                    child: InkWell(
                      onTap: () {
                        // if (index == 4 && Dioo().checkToken()) {
                        //   setState(() {
                        //     if (selectedTab == index) {
                        //       contrl.animateTo(0,
                        //           duration: const Duration(milliseconds: 300),
                        //           curve: Curves.linear);
                        //     }
                        //     selectedTab = index;
                        //   });
                        // }
                        if (index == 2 && Dioo().checkToken()) {
                          setState(() {
                            if (selectedTab == index) {
                              contrl.animateTo(0,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            }
                            selectedTab = index;
                          });
                          // Dioo().comingSoon();
                        } else if (index < 4) {
                          setState(() {
                            if (selectedTab == index) {
                              contrl.animateTo(0,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            }
                            selectedTab = index;
                          });
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: SizedBox(
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
        ),
      ),
    );
  }
}
