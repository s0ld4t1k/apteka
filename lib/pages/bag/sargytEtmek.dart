// ignore_for_file: file_names

import 'package:apte/pages/bag/bankKarty.dart';
import 'package:apte/pages/bag/nagt.dart';
import 'package:apte/pages/bag/sargyt_page.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SargytEtmek extends StatelessWidget {
  const SargytEtmek({super.key});
  @override
  Widget build(BuildContext context) {
    var jem=ModalRoute.of(context)?.settings.arguments;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          title: Text('${locale[curLN]?['toDoDeliv']}'),
        ),
        body: GestureDetector(
          onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 130,
                      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text('${locale[curLN]?['tolegUsuly']}',),
                          const SizedBox(height: 12,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromRGBO(245, 245, 245, 1)
                            ),
                            padding: const EdgeInsets.all(4),
                            // height: 50,
                            child: TabBar(
                              unselectedLabelColor: Colors.black,
                              unselectedLabelStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                              labelPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 34),
                              labelColor: Colors.white,
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              indicatorColor: Colors.red,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: green
                              ),
                              dividerColor: Colors.transparent,
                              tabs:  [
                                Text('${locale[curLN]?['nagt']}'),
                                Text('${locale[curLN]?['bankKarty']}'),
                              ]
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: [
                          Nagt(),
                          BankKarty(),
                        ]
                      ),
                    ),
                    
                  ],
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    // height: 105,
                    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.05),
                        ),
                      ]
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text('${locale[curLN]?['res']}',style: const TextStyle(
                                    color: Color.fromRGBO(107, 107, 107, 1),
                                  ),),
                                  Text('$jem TMT',style: const TextStyle(
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
                              onPressed: (){
                                Get.to(()=>const SargytPage());
                                Get.dialog(
                                  AlertDialog(
                                  surfaceTintColor: Colors.white,
                                  content:  SizedBox(
                                    width: 271,
                                    height: 249,
                                    child: Stack(
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 81,
                                              height: 81,
                                              child: Image.asset('assets/images/greenTick.png')
                                            ),
                                            const SizedBox(height: 10,),
                                            Text(locale[curLN]!['succesOrderText1']!,style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700,
                                            ),),
                                            const SizedBox(height: 10,),
                                            Text(locale[curLN]!['succesOrderText2']!,style: const TextStyle(
                                              color: Color.fromRGBO(160, 160, 160, 1),
                                            ),textAlign: TextAlign.center,),
                                          ],
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: GestureDetector(
                                            onTap: () => Get.back(),
                                            child: Container(
                                              width: 37,
                                              height: 37,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(37),
                                                color: const Color.fromRGBO(250, 250, 250, 1)
                                              ),
                                              child: const Icon(Icons.close),
                                            ),
                                          )
                                        )
                                      ],
                                    ),
                                  ),
                                )
                                );
                              }, 
                              child:  Text('${locale[curLN]?['toDeliv']}',style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),)
                            ),
                          ],
                        ),
                      ],
                    )
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}