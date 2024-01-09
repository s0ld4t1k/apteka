import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/horizontalProducts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
var _liked=false;
List _infoList=[
  ['Öndüriji:','БАЛКАНФАРМА - Болгария',],
  ['Görnüşi:','Kapsula',],
  ['Ulanylyş möhleti:','3 ýyl',],
  ['Dänejikleriň sany:','24 sany',],
];
List _gorkezmeList=[
  ['Haryt barada','Алмагель А (Almagel® A) Состав и форма выпуска 5 мл суспензии для приема внутрь содержит алюминия гидроксида 300 мг (эквивалентно 200 мг оксида алюминия), магния гидроксида 100 мг и анестезина 100 мг; в пластиковых флаконах по 170 мл в комплекте с дозировочной ложкой, в картонной пачке 1 флакон. Характеристика Суспензия белого или слегка сероватого цвета с характерным сладковатым вкусом и запахом лимона. Фармакологическое действие и анестезина 100 мг; в пластиковых флаконах по 170 мл в комплекте с дозировочной ложкой, в картонной пачке 1 флакон Фармакологическое действие — обволакивающее, адсорбирующее, антацидное.',],
  ['Düzümi','kakashka 1 kg',],
  ['Saklanyş şerti','C -25',],
  ['Ulanyş usuly we dozasy','bir yerine dykmaly',],
  ['Ulanmak maslahat berilmeýänler','dolboyoblar',],
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
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 40),
                    width: 325,
                    alignment: Alignment.center,
                    height: 200,
                    child: Center(
                      child: Image.asset('assets/images/melotanin.png'),
                    ),
                  ),
                  SizedBox(height: 10,),
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
                    children: List.generate(_gorkezmeList.length, (index) => _InfoRow(index: index)), 
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
// ignore: must_be_immutable
class _InfoRow extends StatefulWidget {
  final index;
  var _up=true;
  _InfoRow({super.key,required this.index});
  @override
  State<_InfoRow> createState() => _InfoRowState();
}

class _InfoRowState extends State<_InfoRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              widget._up=!widget._up;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Text(_gorkezmeList[widget.index][0],style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),),
                Spacer(),
                Center(
                  child: Icon(
                    (widget._up==false)?CupertinoIcons.chevron_up
                    :CupertinoIcons.chevron_down,
                    color: Color.fromRGBO(156, 156, 156, 1),
                    size: 17,
                  ),
                ),
              ],
            ),
          ),
        ),
        (!widget._up)?Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Text(_gorkezmeList[widget.index][1]),
        ):Container(),
        Container(
          height: 1,
          width: double.infinity,
          color: Color.fromRGBO(235, 235, 235, 1),
        ),
      ],
    );
  }
}