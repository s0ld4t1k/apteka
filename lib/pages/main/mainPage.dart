import 'package:apte/pages/bag/bag.dart';
import 'package:apte/pages/kard/kard.dart';
import 'package:apte/pages/kategory/kategory.dart';
import 'package:apte/pages/main/mainPageWidget.dart';
import 'package:apte/pages/profile/profile.dart';
import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
var selectedTab=0;
List _bottomAppBarList=[
  'assets/icons/home.svg',
  'assets/icons/category.svg',
  'assets/icons/bag.svg',
  'assets/icons/card.svg',
  'assets/icons/profile.svg',
];
List _tabs=[
  MainPageWidget(),
  Kategory(),
  Bag(),
  Kard(),
  Profile(),
];
class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[selectedTab],
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_bottomAppBarList.length, (index) => 
            (index==2)?
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab=index;
                });
              },
              child: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(46),
                ),
                child: Center(child: SvgPicture.asset(_bottomAppBarList[index])),
              ),
            )
            :IconButton(
              onPressed: (){
                setState(() {
                  selectedTab=index;
                });
              }, 
              icon: SvgPicture.asset(
                _bottomAppBarList[index],
                color: (selectedTab==index)?green:tabIconGrey,
              ),
            ),),
          ),
        ),
      ),
    );
  }
}