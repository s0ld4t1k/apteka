// ignore_for_file: file_names

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
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder:(context, index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: sargytBorder),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 75,
                        height: 70,
                        child: Image.asset(garasylyanlar[0]['products'][index]['imgUrl']),
                      ),
                      const SizedBox(width: 15,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(garasylyanlar[0]['products'][index]['name'],style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),),
                            const SizedBox(height: 4,),
                            Text(garasylyanlar[0]['products'][index]['desc'],style: const TextStyle(
                              color: Color.fromRGBO(113, 114, 122, 1),
                              fontSize: 12,
                            ),),
                            const SizedBox(height: 13,),
                            Row(
                              children: [
                                Expanded(
                                  child: Text('${locale[curLN]?['count']}: ${garasylyanlar[0]['products'][index]['count']}',style: const TextStyle(
                                    color: green,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),),
                                ),
                                Text(garasylyanlar[0]['products'][index]['price'],style: const TextStyle(
                                  fontSize: 14,
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
              separatorBuilder:(context, index) => const SizedBox(height: 15,), 
              itemCount: garasylyanlar[0]['products'].length
            ),
            const SizedBox(height: 30,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: sargytBorder),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 14),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/discount.svg'),
                  const SizedBox(width: 10,),
                  Text(garasylyanlar[0]['promokod'],style: const TextStyle(
                    fontSize: 16
                  ),),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${locale[curLN]?['toleg']}',style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16
                ),),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 37,
                  child: Row(
                    children: [
                      Text('${locale[curLN]?['resPrice']}',style: const TextStyle(
                        color: sargytTextGrey,
                        fontSize: 16
                      ),),
                      const Spacer(),
                      Text(garasylyanlar[0]['jemiBaha'],style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color:Color.fromRGBO(107, 107, 107, 1),
                      ),)
                    ],
                  ),
                ),
                SizedBox(
                  height: 37,
                  child: Row(
                    children: [
                      Text('${locale[curLN]?['arzanladysh']}',style: const TextStyle(
                        color: sargytTextGrey,
                        fontSize: 16,
                      ),),
                      const Spacer(),
                      Text(garasylyanlar[0]['arzanladysh'],style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: red,
                      ),)
                    ],
                  ),
                ),
                SizedBox(
                  height: 37,
                  child: Row(
                    children: [
                      Text('${locale[curLN]?['deliveryHyzmat']}',style: const TextStyle(
                        color: sargytTextGrey,
                        fontSize: 16,
                      ),),
                      const Spacer(),
                      Text(garasylyanlar[0]['eltipBermekHyzmaty'],style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: sargytTextGrey,
                        fontSize: 16,
                      ),)
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: const Color.fromRGBO(183, 183, 183, 1),
                ),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(
                      child: Text('${locale[curLN]?['res']}',style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16
                      ),),
                    ),
                    Text(garasylyanlar[0]['jemi'],style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}