import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/gorkezmeInfoRow.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/main/horizontalProducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
var _liked=false,_curIndex=0;
List infoList=[];

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    gorkezmeList=[
      ['${locale[curLN]?["aboutproduct"]}','Алмагель А (Almagel® A) Состав и форма выпуска 5 мл суспензии для приема внутрь содержит алюминия гидроксида 300 мг (эквивалентно 200 мг оксида алюминия), магния гидроксида 100 мг и анестезина 100 мг; в пластиковых флаконах по 170 мл в комплекте с дозировочной ложкой, в картонной пачке 1 флакон. Характеристика Суспензия белого или слегка сероватого цвета с характерным сладковатым вкусом и запахом лимона. Фармакологическое действие и анестезина 100 мг; в пластиковых флаконах по 170 мл в комплекте с дозировочной ложкой, в картонной пачке 1 флакон Фармакологическое действие — обволакивающее, адсорбирующее, антацидное.',],
      ['${locale[curLN]?["duzum"]}','kakashka 1 kg',],
      ['${locale[curLN]?["saklanyshy"]}','C -25',],
      ['${locale[curLN]?["ulanylyshy"]}','bir yerine dykmaly',],
      ['${locale[curLN]?["manLimit"]}','dolboyoblar',],
    ];
    infoList=[
      ['${locale[curLN]?["onduriji"]}:','БАЛКАНФАРМА - Болгария',],
      ['${locale[curLN]?["gornushi"]}:','Kapsula',],
      ['${locale[curLN]?["ulanyshDate"]}:','3 ýyl',],
      ['${locale[curLN]?["daneSany"]}:','24 sany',],
    ];
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
              child: const Icon(Icons.chevron_left_rounded),
            ),
            Expanded(
              child: Center(child: Text('${locale[curLN]?["productInfo"]}')),
            ),
            SizedBox(
              width: 20,
              height: 20,
              child: GestureDetector(
                onTap: () {
                  Share.share('text');
                },
                child: SvgPicture.asset('assets/icons/share.svg')
              ),
            ),
            const SizedBox(width: 22,),
            SizedBox(
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
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
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
                                    SizedBox(
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
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: _curIndex==index?green:const Color.fromRGBO(234, 234, 234, 1),
                              ),
                            )),
                          )
                        )
                      ],
                    ),
                  ),
                  const Text('Солвибене гель для наружного при-менения 150мг',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),
                  const SizedBox(height: 10,),
                  const Text('115.00 TMT',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: green,
                  ),),
                  const Devider(),
                  SizedBox(
                    height: 81+18+18,
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 15,);
                      },
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 18,
                          child: Row(
                            children: [
                              Text(infoList[index][0],style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(133, 133, 133, 1)
                              ),),
                              const Spacer(),
                              Text(infoList[index][1],style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),),
                            ],
                          ),
                        );
                      },
                      itemCount: infoList.length,
                    ),
                  ),
                  const Devider(),
                  Text('${locale[curLN]?["gorkezme"]}',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),
                  const SizedBox(height: 10,),
                  Column(
                    children: List.generate(gorkezmeList.length, (index) => InfoRow(index: index)), 
                  ),
                ],
              ),
            ),
            const SizedBox(height: 38,),
            Container(
              width: double.infinity,
              height: 254,
              color: const Color.fromRGBO(253, 253, 253, 1),
              child: HorizontalProducts(text: 'Meňzeş harytlar',)
            ),
            Container(
              padding: const EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 25),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${locale[curLN]?["price"]}',style: TextStyle(
                        color: textGrey,
                      ),),
                      Text('115.00 TMT',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      minimumSize: MaterialStateProperty.all(const Size(196, 47)),
                    ),
                    onPressed: (){}, 
                    child: Text('${locale[curLN]?["addCart"]}',style: TextStyle(
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
    margin: const EdgeInsets.symmetric(vertical: 25),
    height: 1,
    width: double.infinity,
    color: const Color.fromRGBO(237, 237, 237, 1),
    );
  }
}