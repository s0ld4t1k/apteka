import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/widgets/bagProductList.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/horizontalProducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            Text('Sebedim'),
            Spacer(),
            TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(red.withOpacity(0.1)),
              ),
              onPressed: (){
                setState(() {
                  productList.removeRange(0, productList.length);
                });
              }, 
              child: Text('Boşat',style: TextStyle(
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
                      var _splitted=productList[index][2].toString().split(' ');
                      _harytJemi+=double.parse(_splitted[0]);
                      _jemiList[0][1]='$_harytJemi TMT';
                      return BagProductList(index: index,);
                    }),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        showDragHandle: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                        ),
                        context: context, 
                        builder:(context) {
                          return InkWell(
                            splashFactory: NoSplash.splashFactory,
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: MediaQuery.of(context).
                              viewInsets.bottom),
                              height: 200,
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Promokod',style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                  SizedBox(height: 21,),
                                  Container(
                                    height: 49,
                                    child: TextField(
                                      expands: true,
                                      maxLines: null,
                                      minLines: null,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                        labelText: 'Promokod', 
                                        labelStyle: TextStyle(
                                          color: green,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: green
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: green
                                          )
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 21,),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                        green.withOpacity(0.7)
                                      ),
                                    ),
                                    onPressed: (){}, 
                                    child: Text('Giriz',style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },);
                    },
                    child: Container(
                      height: 51,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color.fromRGBO(234, 234, 234, 1)),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 15),
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/discount.svg'),
                          SizedBox(width: 15,),
                          Text('Promokod giriziň',style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),),
                          Spacer(),
                          Icon(Icons.chevron_right_rounded,size: 20,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text('Eltip berme görnüşi'),
                  SizedBox(height: 20,),
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
                  SizedBox(height: 40,),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.05)
                  ),
                ],
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))
              ),
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(31),
                      color: Color.fromRGBO(205, 205, 205, 1),
                    ),
                  ),
                  SizedBox(height: 7,),
                  Column(
                    children: List.generate(_jemiList.length, (index) => Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      height: 37,
                      child: Row(
                        children: [
                          Text(_jemiList[index][0],style: TextStyle(
                            color: Color.fromRGBO(107, 107, 107, 1),
                          ),),
                          Spacer(),
                          Text(_jemiList[index][1],style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: index==1?red:Color.fromRGBO(107, 107, 107, 1),
                          ),)
                        ],
                      ),
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: List.generate(
                      ((MediaQuery.of(context).size.width-50)~/8) as int, 
                      (index) => Text('-',style: TextStyle(
                        color: Color.fromRGBO(183, 183, 183, 1),
                      ),),
                    ),
                  ),
                  SizedBox(height: 23,),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Jemi',style: TextStyle(
                              color: Color.fromRGBO(107, 107, 107, 1),
                            ),),
                            Text('${_arzanladys+_harytJemi+_eltipberme} TMT',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),)
                          ],
                        )
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(196, 46)),
                          elevation: MaterialStateProperty.all(1),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))  
                        ),
                        onPressed: ()=>Navigator.of(context).pushNamed(
                          '/bag/sargytEtmek',arguments: _arzanladys+_harytJemi+_eltipberme,
                        ), 
                        child: Text('Sargyt et',style: TextStyle(
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
  const _EltmeCon({super.key, this.text1, this.text2, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 13),
      decoration: BoxDecoration(
        color: index==_curEltme
        ?green.withOpacity(0.1):null,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: index==_curEltme
          ?green:Color.fromRGBO(242, 242, 242, 1),
        )
      ),
      child: Row(
        children: [
          Container(
            width: 76,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text1,style: TextStyle(
                  color: Color.fromRGBO(107, 107, 107, 1),
                ),),
                Text(text2,style: TextStyle(
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
                      ?green:Color.fromRGBO(242, 242, 242, 1),
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