import 'package:apte/widgets/category.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/harmful.dart';
import 'package:apte/widgets/horizontalProducts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
List _carouselList=[
  ['assets/images/carouselBanner1.png','Ähli harytlara 10% arzanladyş','4-nji dekabr 2023- 10-njy ýanwar 2024',],
  ['assets/images/carouselBanner1.png','Ähli harytlara 10% arzanladyş','4-nji dekabr 2023- 10-njy ýanwar 2024',],
  ['assets/images/carouselBanner1.png','Ähli harytlara 10% arzanladyş','4-nji dekabr 2023- 10-njy ýanwar 2024',],
];

class MainPageWidget extends StatelessWidget {
  const MainPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bc,
      appBar: AppBar(
        titleSpacing: 25,
        title: _Appbar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            CarouselSlider(
              items: List.generate(_carouselList.length, (index) => Container(
                width: 325,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: AssetImage(_carouselList[index][0]),fit: BoxFit.fill),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 130,
                      margin: EdgeInsets.only(left: 24),
                      child: Text(_carouselList[index][1],style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: blue,
                      ),),
                    ),
                    SizedBox(height: 12,),
                    Container(
                      width: 127,
                      margin: EdgeInsets.only(left: 24),
                      child: Text(_carouselList[index][2],style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),)
                    ),
                  ],
                ),
              )), 
              options: CarouselOptions(
                viewportFraction: 0.85,
                height: 136,
                autoPlay: true,
                enableInfiniteScroll: false,
              )
            ),
            SizedBox(height: 23,),
            MainCategory(),
            SizedBox(height: 8,),
            HorizontalProducts(text: 'Arzanladyşlar',),
            HorizontalProducts(text: 'Täzeler',),
            HorizontalProducts(text: 'Kosmetiki serişdeler',),
            MainHarmful(),
            HorizontalProducts(text: 'Dermanlyk serişdeler',),
            HorizontalProducts(text: 'Lukmançylyk hajatly önümler',),
            SizedBox(height: 34-15,),
          ],
        ),
      ),
    );
  }
}
class _Appbar extends StatelessWidget {
  const _Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 11),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/mainPage/search');
              },
              child: Container(
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: searchConGrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/search.svg'),
                          SizedBox(width: 15,),
                          Text('Harydyň adyny giriziň',style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: textGrey3,
                          ),),
                        ],
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 1,
                      color: textGrey3,
                    ),
                    SizedBox(width: 14,),
                    GestureDetector(
                      onTap: (){
                        print('object');
                      },
                      child: SvgPicture.asset('assets/icons/scan.svg'),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10,),
          GestureDetector(
            onTap: () {
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: green,
              ),
              child: Center(child: SvgPicture.asset('assets/icons/call.svg')),
            ),
          ),
        ],
      ),
    );
  }
}