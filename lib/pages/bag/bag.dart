import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/widgets/bag&Card/eltmeCon.dart';
import 'package:apte/widgets/bag&Card/showPromokod.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langController.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/main/horizontalProducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
var harytJemi=0.0;
var arzanladys=0.0;
var eltipberme=15.0;
List jemiList=[];
List eltmeList=[];
class Bag extends StatefulWidget {
  const Bag({super.key});

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  LangCont lc=Get.find();
  @override
  Widget build(BuildContext context) {
    jemiList=[
      ['${locale[curLN]?["resPrice"]}','0.0 TMT',],
      ['${locale[curLN]?["arzanladysh"]}','0.0 TMT',],
      ['${locale[curLN]?["deliveryHyzmat"]}','15.0 TMT',],
    ];
    eltmeList=[
      ['${locale[curLN]?["delivery1Hour"]}','15 ${locale[curLN]?["manat"]}',],
      ['${locale[curLN]?["delivery30min"]}','25 ${locale[curLN]?["manat"]}',],
    ];
    harytJemi=0.0;
    jemiList[0][1]='$harytJemi TMT';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 25,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text('${locale[curLN]?["cart"]}'),
            const Spacer(),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(red.withOpacity(0.1)),
              ),
              onPressed: (){
                setState(() {
                  productList.removeRange(0, productList.length);
                });
              }, 
              child: Text('${locale[curLN]?["clean"]}',style: TextStyle(
                color: red,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),)
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: contrl,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: List.generate(productList.length, (index){
                      var splitted=productList[index][2].toString().split(' ');
                      harytJemi+=double.parse(splitted[0]);
                      jemiList[0][1]='$harytJemi TMT';
                      return Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: const Color.fromRGBO(242, 242, 242, 1),),
                            ),
                            height: 100,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  width: 90,
                                  height: 100,
                                  child: Image.asset(productList[index][0]),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 16,right: 40,top: 12,bottom: 12),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(productList[index][1],style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,),
                                        const SizedBox(height: 4,),
                                        Text(productList[index][4],style: const TextStyle(
                                          color: Color.fromRGBO(113, 114, 122, 1),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,),
                                        const SizedBox(height: 4+4+4,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 75,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 24,
                                                    height: 24,
                                                    decoration: BoxDecoration(
                                                      color: green.withOpacity(0.1),
                                                      borderRadius: BorderRadius.circular(24),
                                                    ),
                                                    child: IconButton(
                                                      onPressed: (){
                                                        setState(() {
                                                          if(productList[index].last>1)productList[index].last--;
                                                        });
                                                      },
                                                      splashRadius: 15, 
                                                      padding: const EdgeInsets.all(0),
                                                      constraints: const BoxConstraints(
                                                        maxHeight: 24,
                                                        maxWidth: 24,
                                                        minHeight: 24,
                                                        minWidth: 24,
                                                      ),
                                                      icon: const Icon(Icons.remove_rounded,color:green,size: 17,),
                                                    ),
                                                  ),
                                                  Text(productList[index].last.toString()),
                                                  Container(
                                                    width: 24,
                                                    height: 24,
                                                    decoration: BoxDecoration(
                                                      color: green.withOpacity(0.1),
                                                      borderRadius: BorderRadius.circular(24),
                                                    ),
                                                    child: IconButton(
                                                      splashRadius: 15, 
                                                      padding: EdgeInsets.all(0),
                                                      constraints: BoxConstraints(
                                                        maxHeight: 24,
                                                        maxWidth: 24,
                                                        minHeight: 24,
                                                        minWidth: 24,
                                                      ),
                                                      onPressed: (){
                                                        setState(() {
                                                          productList[index].last++;
                                                        });
                                                      },
                                                      icon: const Icon(Icons.add_rounded,color:green,size: 17,),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(productList[index][2],style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                            ),)
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              onPressed: (){
                                setState(() {
                                  productList.removeAt(index);
                                });
                              }, 
                              padding: const EdgeInsets.all(0),
                              constraints: const BoxConstraints(
                                maxHeight: 20,
                                maxWidth: 20,
                                minHeight: 20,
                                minWidth: 20,
                              ),
                              icon: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  border: Border.all(color: green,width: 1.2),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: const Icon(Icons.close_rounded,color: green,size: 14,),
                              )
                            )
                          ),
                        ],
                      );
                    }),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        showDragHandle: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                        ),
                        context: context, 
                        builder:(context) {
                          return const ShowPromokod();
                        },);
                    },
                    child: Container(
                      height: 51,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color.fromRGBO(234, 234, 234, 1)),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/discount.svg'),
                          const SizedBox(width: 15,),
                          Text('${locale[curLN]?["promokodInput"]}',style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),),
                          const Spacer(),
                          const Icon(Icons.chevron_right_rounded,size: 20,),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Text('${locale[curLN]?["delivery"]}'),
                  const SizedBox(height: 20,),
                  Row(
                    children: List.generate(eltmeList.length, (index) {
                      return Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            right: index==0?10:0,
                            left: index==0?0:10,
                          ),
                          child: GestureDetector(
                             onTap: (){
                              setState(() {
                                curEltme=index;
                                if(index==1)eltipberme=25;
                                else eltipberme=15;
                                jemiList[2][1]='$eltipberme TMT';
                              });
                            },
                            child: Column(
                              children: [
                                EltmeCon(
                                  text1: eltmeList[index][0],
                                  text2: eltmeList[index][1],
                                  index:index,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
                  ),
                  const SizedBox(height: 40,),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.05)
                  ),
                ],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20))
              ),
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(31),
                      color: const Color.fromRGBO(205, 205, 205, 1),
                    ),
                  ),
                  const SizedBox(height: 7,),
                  Column(
                    children: List.generate(jemiList.length, (index) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 37,
                      child: Row(
                        children: [
                          Text(jemiList[index][0],style: const TextStyle(
                            color: Color.fromRGBO(107, 107, 107, 1),
                          ),),
                          const Spacer(),
                          Text(jemiList[index][1],style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: index==1?red:const Color.fromRGBO(107, 107, 107, 1),
                          ),)
                        ],
                      ),
                    ),),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: List.generate(
                      ((MediaQuery.of(context).size.width-50)~/8), 
                      (index) => const Text('-',style: TextStyle(
                        color: Color.fromRGBO(183, 183, 183, 1),
                      ),),
                    ),
                  ),
                  const SizedBox(height: 23,),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${locale[curLN]?["res"]}',style: TextStyle(
                              color: Color.fromRGBO(107, 107, 107, 1),
                            ),),
                            Text('${arzanladys+harytJemi+eltipberme} TMT',style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),)
                          ],
                        )
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(const Size(196, 46)),
                          elevation: MaterialStateProperty.all(1),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))  
                        ),
                        onPressed: ()=>Navigator.of(context).pushNamed(
                          '/bag/sargytEtmek',arguments: arzanladys+harytJemi+eltipberme,
                        ), 
                        child: Text('${locale[curLN]?["toDeliv"]}',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),)
                      )
                    ],
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