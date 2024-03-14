import 'package:apte/pages/bag/addAdres.dart';
import 'package:apte/pages/bag/sargytEtmek.dart';
import 'package:apte/pages/bag/sargyt_page.dart';
import 'package:apte/pages/profile/habarlasmak.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
TextEditingController name=TextEditingController();
TextEditingController tel=TextEditingController();
TextEditingController com=TextEditingController();
RxBool nameErr=false.obs,telErr=false.obs,comErr=false.obs;
class Nagt extends StatelessWidget {
  const Nagt({super.key});

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
                    onChanged: (value)=>nameErr.value=false,
                    controller: name,
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
                Obx(() => nameErr.value?const ErrMsg():Container()),
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
                          onChanged: (value)=>telErr.value=false,
                          controller: tel,
                          maxLength: 8,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            counterText: '',
                            contentPadding: EdgeInsets.all(0),
                            border: OutlineInputBorder(
                              gapPadding: 0,
                              borderSide: BorderSide.none
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(() => telErr.value?const ErrMsg():Container()),
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
                      isScrollControlled: true,
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
                    onChanged: (value)=>comErr.value=false,
                    controller: com,
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
                Obx(() => comErr.value?const ErrMsg():Container()),
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
                        if(name.text=='' || tel.text=='' || com.text==''){
                          if(name.text=='')nameErr.value=true;
                          if(tel.text=='')telErr.value=true;
                          if(com.text=='')comErr.value=true;
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
