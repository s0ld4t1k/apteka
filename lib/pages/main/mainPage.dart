import 'package:apte/pages/bag/bag.dart';
import 'package:apte/pages/kard/kard.dart';
import 'package:apte/pages/kategory/kategory.dart';
import 'package:apte/pages/main/mainPageWidget.dart';
import 'package:apte/pages/profile/profile.dart';
import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
ScrollController contrl=ScrollController();
var selectedTab=0;
List bottomAppBarList=[
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
            children: List.generate(bottomAppBarList.length, (index) => 
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
                child: Center(child: SvgPicture.asset(bottomAppBarList[index])),
              ),
            )
            :IconButton(
              onPressed: (){
                setState(() {
                  if(selectedTab==index)contrl.animateTo(0,duration: Duration(milliseconds: 300),curve: Curves.linear);
                  selectedTab=index;
                });
              }, 
              icon: SvgPicture.asset(
                bottomAppBarList[index],
                color: (selectedTab==index)?green:tabIconGrey,
              ),
            ),),
          ),
        ),
      ),
    );
  }
}