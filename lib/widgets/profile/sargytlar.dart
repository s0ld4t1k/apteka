import 'package:apte/pages/profile/sargyt.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/profile/sargytInfo.dart';
import 'package:apte/widgets/statusCon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class Sargytlarym extends StatefulWidget {
  const Sargytlarym({super.key});

  @override
  State<Sargytlarym> createState() => _SargytlarymState();
}

class _SargytlarymState extends State<Sargytlarym> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(garasylyanlar.length, (index){
          if(garasylyanlar[index]['status']!='Garaşylýar')
          return GestureDetector(
            onTap: ()=>Get.to(()=>SargytInfo()),
            child: Container(
              margin: EdgeInsets.only(bottom: 15),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: sargytBorder),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text('${locale[curLN]?['yagdayy']}:'),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            StatusCon(text: garasylyanlar[index]['status']),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: Text('${locale[curLN]?['orderID']}:'),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Text(garasylyanlar[index]['sargytBelgisi'],style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: Text('${locale[curLN]?['date']}:'),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Text(garasylyanlar[index]['senesi'],style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: Text('${locale[curLN]?['res']}:',style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Text(garasylyanlar[index]['jemi'],style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: green,
                        ),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
          else return Container();
        }),
      ),
    );
  }
}