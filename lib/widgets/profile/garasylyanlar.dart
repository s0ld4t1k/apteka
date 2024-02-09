import 'package:apte/pages/profile/sargyt.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/profile/sargytInfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Garasylyanlar extends StatefulWidget {
  const Garasylyanlar({super.key});

  @override
  State<Garasylyanlar> createState() => _GarasylyanlarState();
}

class _GarasylyanlarState extends State<Garasylyanlar> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(garasylyanlar.length, (index){
          if(garasylyanlar[index]['status']=='Garaşylýar')
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
                        child: Text('Ýagdaýy:'),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 4,horizontal: 13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27),
                                color: yellow.withOpacity(0.1),
                              ),
                              child: Text(garasylyanlar[index]['status'],style: TextStyle(
                                color: yellow,
                              ),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: Text('Sargyt belgisi:'),
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
                        child: Text('Senesi:'),
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
                        child: Text('Jemi:',style: TextStyle(
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