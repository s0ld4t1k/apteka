import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/gorkezmeInfoRow.dart';
import 'package:apte/widgets/horizontalProducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
var _liked=false,_curIndex=0;
List _infoList=[
  ['Öndüriji:','БАЛКАНФАРМА - Болгария',],
  ['Görnüşi:','Kapsula',],
  ['Ulanylyş möhleti:','3 ýyl',],
  ['Dänejikleriň sany:','24 sany',],
];

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 25,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.chevron_left_rounded),
            ),
            Spacer(),
            Container(
              width: 20,
              height: 20,
              child: GestureDetector(
                onTap: () {
                  Share.share('text');
                },
                child: SvgPicture.asset('assets/icons/share.svg')
              ),
            ),
            SizedBox(width: 22,),
            Container(
              width: 20,
              height: 20,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _liked=!_liked;
                  });
                },
                child: (_liked)?SvgPicture.asset('assets/icons/redHeart.svg')
                :SvgPicture.asset('assets/icons/heart.svg',color: Colors.black.withOpacity(0.75),)
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180,
                    child: Stack(
                      children: [
                        PageView(
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (value) {
                            setState(() {
                              _curIndex=value;
                            });
                          },
                          children: List.generate(productList.length, (index) => Stack(
                            children: [
                              Positioned(
                                top: 12,
                                right: 0,
                                left: 0,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 172,
                                      height: 110,
                                      child: Image.asset(productList[index][0]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),),
                        ),
                        Positioned(
                          bottom: 23,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(productList.length, (index) => Container(
                              width: 6,
                              height: 6,
                              margin: EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: _curIndex==index?green:Color.fromRGBO(234, 234, 234, 1),
                              ),
                            )),
                          )
                        )
                      ],
                    ),
                  ),
                  Text('Солвибене гель для наружного при-менения 150мг',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(height: 10,),
                  Text('115.00 TMT',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: green,
                  ),),
                  Devider(),
                  Container(
                    height: 81+18+18,
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 15,);
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          height: 18,
                          child: Row(
                            children: [
                              Text(_infoList[index][0],style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(133, 133, 133, 1)
                              ),),
                              Spacer(),
                              Text(_infoList[index][1],style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),),
                            ],
                          ),
                        );
                      },
                      itemCount: _infoList.length,
                    ),
                  ),
                  Devider(),
                  Text('Görkezme',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(height: 10,),
                  Column(
                    children: List.generate(gorkezmeList.length, (index) => InfoRow(index: index)), 
                  ),
                ],
              ),
            ),
            SizedBox(height: 38,),
            Container(
              width: double.infinity,
              height: 254,
              color: Color.fromRGBO(253, 253, 253, 1),
              child: HorizontalProducts(text: 'Meňzeş harytlar',)
            ),
            Container(
              padding: EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 25),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bahasy',style: TextStyle(
                        color: textGrey,
                      ),),
                      Text('115.00 TMT',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      minimumSize: MaterialStateProperty.all(Size(196, 47)),
                    ),
                    onPressed: (){}, 
                    child: Text('Sebede goş',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),)
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Devider extends StatelessWidget {
  const Devider({super.key});

  @override
  Widget build(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 25),
    height: 1,
    width: double.infinity,
    color: Color.fromRGBO(237, 237, 237, 1),
    );
  }
}