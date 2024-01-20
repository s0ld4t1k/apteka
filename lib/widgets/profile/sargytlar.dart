import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
List sargytlar=[
  [
    ['assets/images/spray.png','Мультивитамины для детей','20.00','29 Dek, 13:32','03','1624',],
    false,
  ],
  [
    ['assets/images/lorangin.png','Мультивитамины для детей','20.00','29 Dek, 13:32','03','1624',],
    ['assets/images/gel.png','Мультивитамины для детей','20.00','29 Dek, 13:32','03','1624',],
    true,
  ],
  [
    ['assets/images/melotanin.png','Мультивитамины для детей','20.00','29 Dek, 13:32','03','1624',],
    false,
  ],
  [
    ['assets/images/multiVitamin.png','Мультивитамины для детей','20.00','29 Dek, 13:32','03','1624',],
    ['assets/images/vitaminC.png','Мультивитамины для детей','20.00','29 Dek, 13:32','03','1624',],
    true,
  ],
];
class Sargytlarym extends StatefulWidget {
  const Sargytlarym({super.key});

  @override
  State<Sargytlarym> createState() => _SargytlarymState();
}

class _SargytlarymState extends State<Sargytlarym> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
      child: Column(
        children: List.generate(sargytlar.length, (index) => Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color.fromRGBO(242, 242, 242, 1))
                  ),
                  child: Column(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0),
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder:(context, i) {
                          if(i<sargytlar[index].length-1)
                          return Container(
                            height: 89,
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 22),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  child: Image.asset(sargytlar[index][i][0]),
                                ),
                                SizedBox(width: 13,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(sargytlar[index][i][1],style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                      SizedBox(height: 11,),
                                      Row(
                                        children: [
                                          Text('${sargytlar[index][i][2]} TMT',style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),),
                                          Container(
                                            width: 1,
                                            height: 16,
                                            margin: EdgeInsets.symmetric(horizontal: 14),
                                            color: Color.fromRGBO(202, 204, 218, 1),
                                          ),
                                          Text('${sargytlar[index][i][3]} sany',style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(107, 110, 130, 1),
                                          ),)
                                        ],
                                      ),
                                    ],
                                  )
                                ),
                              ],
                            ),
                          );
                          return null;
                        }, 
                        separatorBuilder:(context, _) => Container(
                          width: double.infinity,
                          height: 1,
                          color: Color.fromRGBO(238, 242, 246, 1),
                        ), 
                        itemCount: sargytlar[index].length,
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Color.fromRGBO(238, 242, 246, 1),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 21,vertical: 9),
                        child: Row(
                          children: [
                            Text(
                              sargytlar[index].last?'Kabul edildi':'Goýbolsun edildi',
                              style: TextStyle(
                                color: sargytlar[index].last?green:red,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  sargytlar.removeAt(index);
                                });
                              },
                              child: SvgPicture.asset('assets/icons/delete.svg'),
                            ),
                          ],
                        ),
                      ) 
                    ],
                  )
                ),
                Positioned(
                  top: 22,
                  right: 15,
                  child: Text('#${sargytlar[index][0][5]}',style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: green,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),)
                )
              ],
            ),
            SizedBox(height: 20,),
          ],
        )),
      ),
    );
  }
}