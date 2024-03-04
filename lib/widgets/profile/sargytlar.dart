import 'package:apte/pages/profile/sargyt.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:apte/widgets/profile/sargytInfo.dart';
import 'package:apte/widgets/statusCon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          if(garasylyanlar[index]['status']!='Garaşylýar') {
            return GestureDetector(
            onTap: ()=>Get.to(()=>const SargytInfo()),
            child: Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(20),
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
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: Text('${locale[curLN]?['orderID']}:'),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: Text(garasylyanlar[index]['sargytBelgisi'],style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: Text('${locale[curLN]?['date']}:'),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: Text(garasylyanlar[index]['senesi'],style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: Text('${locale[curLN]?['res']}:',style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: Text(garasylyanlar[index]['jemi'],style: const TextStyle(
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
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}