import 'package:apte/pages/profile/sargyt.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SargytInfo extends StatelessWidget {
  const SargytInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          padding: const EdgeInsets.all(0),
          constraints: const BoxConstraints(
            maxHeight: 24,
            maxWidth: 24,
            minHeight: 24,
            minWidth: 24,
          ),
          onPressed: ()=>Navigator.pop(context), 
          icon: const Icon(Icons.chevron_left_rounded)
        ),
        title:  Text('${locale[curLN]?['orderInfo']}'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:(context, index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: sargytBorder),
                  ),
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Container(
                        width: 75,
                        height: 70,
                        child: Image.asset(garasylyanlar[0]['products'][index]['imgUrl']),
                      ),
                      SizedBox(width: 15,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(garasylyanlar[0]['products'][index]['name'],style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),),
                            SizedBox(height: 4,),
                            Text(garasylyanlar[0]['products'][index]['desc'],style: TextStyle(
                              color: Color.fromRGBO(113, 114, 122, 1),
                              fontSize: 10,
                            ),),
                            SizedBox(height: 13,),
                            Row(
                              children: [
                                Expanded(
                                  child: Text('Sany: ${garasylyanlar[0]['products'][index]['count']}',style: TextStyle(
                                    color: green,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),),
                                ),
                                Text(garasylyanlar[0]['products'][index]['price'],style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),),
                              ],
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                );
              }, 
              separatorBuilder:(context, index) => SizedBox(height: 15,), 
              itemCount: garasylyanlar[0]['products'].length
            ),
            SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: sargytBorder),
              ),
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 14),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/discount.svg'),
                  SizedBox(width: 10,),
                  Text(garasylyanlar[0]['promokod']),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${locale[curLN]?['toleg']}',style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(height: 10,),
                  Container(
                    height: 37,
                    child: Row(
                      children: [
                        Text('${locale[curLN]?['resPrice']}',style: TextStyle(
                          color: sargytTextGrey,
                        ),),
                        Spacer(),
                        Text(garasylyanlar[0]['jemiBaha'],style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color:Color.fromRGBO(107, 107, 107, 1),
                        ),)
                      ],
                    ),
                  ),
                  Container(
                    height: 37,
                    child: Row(
                      children: [
                        Text('${locale[curLN]?['arzanladysh']}',style: TextStyle(
                          color: sargytTextGrey,
                        ),),
                        Spacer(),
                        Text(garasylyanlar[0]['arzanladysh'],style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: red,
                        ),)
                      ],
                    ),
                  ),
                  Container(
                    height: 37,
                    child: Row(
                      children: [
                        Text('${locale[curLN]?['deliveryHyzmat']}',style: TextStyle(
                          color: sargytTextGrey,
                        ),),
                        Spacer(),
                        Text(garasylyanlar[0]['eltipBermekHyzmaty'],style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: sargytTextGrey,
                        ),)
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Color.fromRGBO(183, 183, 183, 1),
                  ),
                  const SizedBox(height: 16,),
                  Row(
                    children: [
                      Expanded(
                        child: Text('${locale[curLN]?['res']}',style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),),
                      ),
                      Text(garasylyanlar[0]['jemi'],style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}