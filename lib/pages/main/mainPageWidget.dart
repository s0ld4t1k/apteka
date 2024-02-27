import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langController.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/main/category.dart';
import 'package:apte/widgets/main/harmful.dart';
import 'package:apte/widgets/main/horizontalProducts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
List _carouselList=[
  ['assets/images/carouselBanner3.png','Derman serişdeleri','Ählisini görmek',],
  ['assets/images/carouselBanner3.png','Derman serişdeleri','Ählisini görmek',],
];

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LangCont>(
      builder: (cont) {
        return Scaffold(
          backgroundColor: bc,
          appBar: AppBar(
            titleSpacing: 25,
            title: Container(
              margin: const EdgeInsets.symmetric(vertical: 11),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/mainPage/search');
                      },
                      child: Container(
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                  const SizedBox(width: 15,),
                                  Expanded(
                                    child: Text('${locale[curLN]?["searchHint"]}',style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: textGrey3,
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 1,
                              color: textGrey3,
                            ),
                            const SizedBox(width: 14,),
                            GestureDetector(
                              onTap: (){
                              },
                              child: SvgPicture.asset('assets/icons/scan.svg'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  ElevatedButton(
                    onPressed: ()async{
                      if(await canLaunchUrl(Uri(scheme: 'tel',path: '+99361400905')))
                        await launchUrl(Uri(scheme: 'tel',path: '+99361400905'));
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                      minimumSize: MaterialStateProperty.all(const Size(45, 44)),
                    ), 
                    child: SvgPicture.asset('assets/icons/call.svg'),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            controller: contrl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15,),
                CarouselSlider(
                  items: List.generate(_carouselList.length, (index) => Container(
                    width: 325,
                    margin: const EdgeInsets.only(right: 12),
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
                          margin: const EdgeInsets.only(left: 24),
                          child: Text(_carouselList[index][1],style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),),
                        ),
                        const SizedBox(height: 6,),
                        Container(
                          width: 127,
                          margin: const EdgeInsets.only(left: 24),
                          child: Row(
                            children: [
                              Text(_carouselList[index][2],style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),),
                              const Icon(Icons.chevron_right_rounded,color: Colors.white,),
                            ],
                          )
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
                const SizedBox(height: 23,),
                const MainCategory(),
                const SizedBox(height: 8,),
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
    );
  }
}