import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
List garasylyanlar=[
  [
    ['assets/images/spray.png','Мультивитамины для детей','20.00','03','1623',],
  ],
  [
    ['assets/images/spray.png','Мультивитамины для детей','20.00','03','1624',],
    ['assets/images/gel.png','Мультивитамины для детей','20.00','03','1624',],
  ],
];
class Garasylyanlar extends StatefulWidget {
  const Garasylyanlar({super.key});

  @override
  State<Garasylyanlar> createState() => _GarasylyanlarState();
}

class _GarasylyanlarState extends State<Garasylyanlar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
      child: Column(
        children: List.generate(garasylyanlar.length, (index) => Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color.fromRGBO(242, 242, 242, 1))
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder:(context, i) {
                      return Container(
                        height: 89,
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 22),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              child: Image.asset(garasylyanlar[index][i][0]),
                            ),
                            SizedBox(width: 13,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(garasylyanlar[index][i][1],style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                  SizedBox(height: 11,),
                                  Row(
                                    children: [
                                      Text('${garasylyanlar[index][i][2]} TMT',style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),),
                                      Container(
                                        width: 1,
                                        height: 16,
                                        margin: EdgeInsets.symmetric(horizontal: 14),
                                        color: Color.fromRGBO(202, 204, 218, 1),
                                      ),
                                      Text('${garasylyanlar[index][i][3]} sany',style: TextStyle(
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
                    }, 
                    separatorBuilder:(context, _) => Container(
                      width: double.infinity,
                      height: 1,
                      color: Color.fromRGBO(238, 242, 246, 1),
                    ), 
                    itemCount: garasylyanlar[index].length,
                  )
                ),
                Positioned(
                  top: 22,
                  right: 15,
                  child: Text('#${garasylyanlar[index][0][4]}',style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: green,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),)
                )
              ],
            ),
            SizedBox(height: 10,),
            OutlinedButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(orange.withOpacity(0.1)),
                side:MaterialStateProperty.all(
                  BorderSide(color: orange)
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
                minimumSize: MaterialStateProperty.all(Size(double.infinity, 38)),
              ),
              onPressed: (){
                setState(() {
                  garasylyanlar.removeAt(index);
                });
              }, 
              child: Text('Goýbolsun et',style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: orange,
              ),)
            ),
            SizedBox(height: 17,),
          ],
        )),
      ),
    );
  }
}