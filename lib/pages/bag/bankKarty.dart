// ignore_for_file: file_names

import 'package:apte/pages/bag/addAdres.dart';
import 'package:apte/pages/bag/addCard.dart';
import 'package:apte/pages/bag/sargytEtmek.dart';
import 'package:apte/pages/bag/sargyt_page.dart';
import 'package:apte/pages/profile/habarlasmak.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
TextEditingController nameBank=TextEditingController();
TextEditingController telBank=TextEditingController();
TextEditingController comBank=TextEditingController();
RxBool nameErrBank=false.obs,telErrBank=false.obs,comErrBank=false.obs;
class BankKarty extends StatefulWidget {
  const BankKarty({super.key});

  @override
  State<BankKarty> createState() => _BankKartyState();
}

class _BankKartyState extends State<BankKarty> {
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5,),
                 Text('${locale[curLN]?['dolyAdynyz']}'),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(251, 251, 251, 1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
                  ),
                  child:  TextField(
                    controller: nameBank,
                    onChanged: (value) => nameErrBank.value=false,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      hintText: '${locale[curLN]?['dolyAdynyz']}',
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(193, 193, 193, 1),
                        fontSize: 16,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none
                      ),
                    ),
                  ),
                ),
                Obx(() => nameErrBank.value?const ErrMsg():Container()),
                const SizedBox(height: 15,),
                 Text('${locale[curLN]?['tel']}'),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(251, 251, 251, 1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
                  ),
                  child: Row(
                    children: [
                      const Text('+993 ',style: TextStyle(
                        fontSize: 16,
                      ),),
                      Expanded(
                        child: TextField(
                          controller: telBank,
                          onChanged: (value) => telErrBank.value=false,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(() => telErrBank.value?const ErrMsg():Container()),
                const SizedBox(height: 15,),
                 Text('${locale[curLN]?['adres']}'),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      showDragHandle: true,
                      context: context, 
                      builder:(context) {
                      return const AddAdres();
                    },);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(251, 251, 251, 1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
                    ),
                    child:  Row(
                      children: [
                        Text('${locale[curLN]?['chooseAdres']}',style: const TextStyle(
                          color: Color.fromRGBO(193, 193, 193, 1),
                          fontSize: 16,
                        ),),
                        const Spacer(),
                        const Icon(CupertinoIcons.chevron_down,size: 16,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Text('${locale[curLN]?['bankKartynyz']}'),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      showDragHandle: true,

                      context: context, 
                      builder:(context) {
                      return const AddCard();
                    },);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(251, 251, 251, 1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
                    ),
                    child:  Row(
                      children: [
                        Text('${locale[curLN]?['chooseCard']}',style: const TextStyle(
                          color: Color.fromRGBO(193, 193, 193, 1),
                          fontSize: 16,
                        ),),
                        const Spacer(),
                        const Icon(CupertinoIcons.chevron_down,size: 16,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                 Text('${locale[curLN]?['bellik']}'),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  height: 139,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(251, 251, 251, 1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
                  ),
                  child:  TextField(
                    controller: comBank,
                    onChanged: (value) => comErrBank.value=false,
                    textAlignVertical: TextAlignVertical.top,
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      hintText: '${locale[curLN]?['bellik']}',
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(193, 193, 193, 1),
                        fontSize: 16,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none
                      ),
                    ),
                  ),
                ),
                Obx(() => comErrBank.value?const ErrMsg():Container()),
                const SizedBox(height: 30,),
                
              ],
            ),
          ),
          Container(
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
                        if(nameBank.text=='' || telBank.text=='' || comBank.text==''){
                          if(nameBank.text=='')nameErrBank.value=true;
                          if(telBank.text=='')telErrBank.value=true;
                          if(comBank.text=='')comErrBank.value=true;
                        }
                        else{
                          FocusScope.of(context).requestFocus(FocusNode());
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
                        }
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
        ],
      ),
    );
  }
}