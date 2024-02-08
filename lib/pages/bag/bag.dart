import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/widgets/bag&Card/showPromokod.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langController.dart';
import 'package:apte/widgets/main/horizontalProducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
var _curEltme=0;
var _harytJemi=0.0;
var _arzanladys=0.0;
var _eltipberme=15.0;
List _jemiList=[
  ['Jemi baha','0.0 TMT',],
  ['Arzanladyş','0.0 TMT',],
  ['Eltip bermek hyzmaty','15.0 TMT',],
];
List _eltmeList=[
  ['1 Sagatda eliňizde','15 manat',],
  ['30 minutda eliňizde','25 manat',],
];
class Bag extends StatefulWidget {
  const Bag({super.key});

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  LangCont lc=Get.find();
  @override
  Widget build(BuildContext context) {
    _harytJemi=0.0;
    _jemiList[0][1]='$_harytJemi TMT';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 25,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Text('Sebedim'),
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
              child: const Text('Boşat',style: TextStyle(
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
                      _harytJemi+=double.parse(splitted[0]);
                      _jemiList[0][1]='$_harytJemi TMT';
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
                                                    decoration: BoxDecoration(
                                                      color: green.withOpacity(0.1),
                                                      borderRadius: BorderRadius.circular(24),
                                                    ),
                                                    child: IconButton(
                                                      onPressed: (){
                                                        setState(() {
                                                          productList[index].last++;
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
                            top: 11,
                            right: 14,
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
                          )
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
                          const Text('Promokod giriziň',style: TextStyle(
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
                  const Text('Eltip berme görnüşi'),
                  const SizedBox(height: 20,),
                  Row(
                    children: List.generate(_eltmeList.length, (index) {
                      return Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            right: index==0?10:0,
                            left: index==0?0:10,
                          ),
                          child: GestureDetector(
                             onTap: (){
                              setState(() {
                                _curEltme=index;
                                if(index==1)_eltipberme=25;
                                else _eltipberme=15;
                                _jemiList[2][1]='$_eltipberme TMT';
                              });
                            },
                            child: _EltmeCon(
                              text1: _eltmeList[index][0],
                              text2: _eltmeList[index][1],
                              index:index,
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
                    children: List.generate(_jemiList.length, (index) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 37,
                      child: Row(
                        children: [
                          Text(_jemiList[index][0],style: const TextStyle(
                            color: Color.fromRGBO(107, 107, 107, 1),
                          ),),
                          const Spacer(),
                          Text(_jemiList[index][1],style: TextStyle(
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
                            const Text('Jemi',style: TextStyle(
                              color: Color.fromRGBO(107, 107, 107, 1),
                            ),),
                            Text('${_arzanladys+_harytJemi+_eltipberme} TMT',style: const TextStyle(
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
                          '/bag/sargytEtmek',arguments: _arzanladys+_harytJemi+_eltipberme,
                        ), 
                        child: const Text('Sargyt et',style: TextStyle(
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
class _EltmeCon extends StatelessWidget {
  final text1,text2,index;
  const _EltmeCon({this.text1, this.text2, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 13),
      decoration: BoxDecoration(
        color: index==_curEltme
        ?green.withOpacity(0.1):null,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: index==_curEltme
          ?green:const Color.fromRGBO(242, 242, 242, 1),
        )
      ),
      child: Row(
        children: [
          SizedBox(
            width: 76,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text1,style: const TextStyle(
                  color: Color.fromRGBO(107, 107, 107, 1),
                ),),
                Text(text2,style: const TextStyle(
                  color: green,
                  fontSize: 12,
                ),),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: index==_curEltme?4:1,
                      color: index==_curEltme
                      ?green:const Color.fromRGBO(242, 242, 242, 1),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}