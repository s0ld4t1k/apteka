// ignore_for_file: file_names, deprecated_member_use
import 'package:apte/pages/bag/bag.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/gorkezmeInfoRow.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/main/horizontalProducts.dart';
import 'package:apte/widgets/main/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
var _liked=false,_curIndex=0;
List infoList=[];
RxInt countProd=1.obs;
RxBool isClickProd=false.obs;

class ProductPage extends StatefulWidget {
  final RxInt productId;
  const ProductPage({super.key, required this.productId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    countProd=1.obs;
    isClickProd=false.obs;
    int id=widget.productId.value;
    gorkezmeList=[
      ['${locale[curLN]?["aboutproduct"]}',products[id]['info']],
      ['${locale[curLN]?["duzum"]}',products[id]['system']],
      ['${locale[curLN]?["saklanyshy"]}',products[id]['temp']],
      ['${locale[curLN]?["ulanylyshy"]}',products[id]['using']],
      ['${locale[curLN]?["manLimit"]}',products[id]['limit']],
    ];
    infoList=[
      ['${locale[curLN]?["onduriji"]}:',products[id]['onduruji']],
      ['${locale[curLN]?["gornushi"]}:',products[id]['gornushi']],
      ['${locale[curLN]?["ulanyshDate"]}:',products[id]['mohleti']],
      ['${locale[curLN]?["daneSany"]}:',products[id]['daneSany']],
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
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 220,
                          child: Stack(
                            children: [
                              PageView(
                                
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (value) {
                                  setState(() {
                                    _curIndex=value;
                                  });
                                },
                                children: List.generate(products[id]['img'].length, (index) => Stack(
                                  children: [
                                    Positioned(
                                      top: 32,
                                      right: 0,
                                      left: 0,
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.dialog( 
                                                AlertDialog(
                                                  content: Image.asset(products[id]['img'][index]),
                                                  surfaceTintColor: Colors.white,
                                                ),
                                              );
                                            },
                                            child: SizedBox(
                                              width: 172,
                                              height: 110,
                                              child: Image.asset(products[id]['img'][index]),
                                            ),
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
                                  children: List.generate(products[id]['img'].length, (index) => Container(
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
                        Text(products[id]['name'],style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),),
                        const SizedBox(height: 15,),
                        Text('${products[id]['price']} TMT',style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: green,
                        ),),
                        const Devider(),
                        ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 15,);
                          },
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(infoList[index][0],style: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(133, 133, 133, 1)
                                  ),),
                                ),
                                Expanded(
                                  child: Text(infoList[index][1],style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.end,),
                                ),
                              ],
                            );
                          },
                          itemCount: infoList.length,
                        ),
                        const Devider(),
                        const SizedBox(height: 5,),
                        Text('${locale[curLN]?["gorkezme"]}',style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),),
                        const SizedBox(height: 15,),
                        Column(
                          children: List.generate(gorkezmeList.length, (index) => InfoRow(index: index)), 
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 38,),
                  Container(
                    width: double.infinity,
                    // height: 254,
                    color: const Color.fromRGBO(253, 253, 253, 1),
                    child: const HorizontalProducts(text: 'Meňzeş harytlar',)
                  ),
                  const SizedBox(height: 100,)
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0,1),
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.1),
                  )
                ]
              ),
              padding: const EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${locale[curLN]?["price"]}',style: const TextStyle(
                          color: textGrey,
                        ),),
                        Text('${products[id]['price']} TMT',style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () {
                        return isClickProd.value?
                        Row(
                            children: [
                              ElevatedButton(
                                onPressed: (){
                                  countProd.value--;
                                  if(countProd.value<=0){
                                    isClickProd.value=false;
                                    countProd.value=1;
                                  }
                                }, 
                                child: const Icon(Icons.remove)
                              ),
                              Expanded(child: Center(child: Text('${countProd.value}'))),
                              ElevatedButton(
                                onPressed: (){
                                  countProd.value++;
                                }, 
                                child: const Icon(Icons.add)
                              ),
                            ],
                          ):ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                              minimumSize: MaterialStateProperty.all(const Size(double.infinity, 47)),
                            ),
                            onPressed: (){
                              isClickProd.value=true;
                              addToCart();
                            }, 
                            child:Text('${locale[curLN]?["addCart"]}',style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),)
                          );
                      }
                    ),
                  )
                ],
              ),
            ),
          )
        ],
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
  );}
}