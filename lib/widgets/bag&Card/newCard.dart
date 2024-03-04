// ignore_for_file: file_names

import 'package:apte/pages/kard/kard.dart';
import 'package:apte/widgets/bag&Card/showCardType.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
RxInt selectedCardType=(-1).obs;
List month=[
  'Ýanwar',
  'Fewral',
  'Mart',
  'Aprel',
  'Maý',
  'Iýun',
  'Iýul',
  'Awgust',
  'Sentýabr',
  'Oktýabr',
  'Noýabr',
  'Dekabr',
];
class NewCard extends StatefulWidget {
  const NewCard({super.key});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  TextEditingController belgisi=TextEditingController();
  TextEditingController cvc=TextEditingController();
  TextEditingController eyesi=TextEditingController();
  @override
  Widget build(BuildContext context) {
    List list =ModalRoute.of(context)?.settings.arguments as List;
    if(list[1]!='')selectedCardType=list[1];
    if(list[0]!='')belgisi.text=list[0];
    if(list[2]!='')cvc.text=list[2];
    if(list[3]!='')eyesi.text=list[3];
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
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
          title:  Text('${locale[curLN]?['cardInfos']}'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height-231,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text('${locale[curLN]?['cardID']}'),
                    const SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: TextField(
                        onChanged: (value){
                          String s=belgisi.text;
                          if(s.length<16+3 && s.length>3 && s[s.length-1]!=' ' && s[s.length-2]!=' ' && s[s.length-3]!=' ' && s[s.length-4]!=' ') {
                            s+=' ';
                          }
                          belgisi.text=s;
                        },
                        controller: belgisi,
                        maxLength: 16+3,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          counterText: '',
                          hintText: '0000 0000 0000 0000',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(193, 193, 193, 1),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none
                          )
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                     Text('${locale[curLN]?['dateLimit']}'),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(251, 251, 251, 1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
                            ),
                            child: CupertinoPicker(
                              onSelectedItemChanged: (value) {
                                print(value);
                              },
                              itemExtent: 50,
                              selectionOverlay: null,
                              children: List.generate(month.length, (index) => Center(
                                child: Text(month[index],style: const TextStyle(
                                  fontSize: 16,
                                ),),
                              )),
                            ),
                          ),
                        ),
                        const SizedBox(width: 11,),
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(251, 251, 251, 1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
                            ),
                            child:  TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                              hintText: '${locale[curLN]?['year']}',
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(193, 193, 193, 1),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none
                              )
                            ),
                            )
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16,),
                     Text('${locale[curLN]?['cvc']}'),
                    const SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: TextField(
                        controller: cvc,
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          counterText: '',
                          hintText: '***',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(193, 193, 193, 1),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none
                          )
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                     Text('${locale[curLN]?['cardHolder']}'),
                    const SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: TextField(
                        controller: eyesi,
                        decoration:  InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                          counterText: '',
                          hintText: '${locale[curLN]?['cardHolder']}',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(193, 193, 193, 1),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none
                          )
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Text('${locale[curLN]?['cardBankType']}'),
                    const SizedBox(height: 10,),
                    GestureDetector(
                      onTap: ()=>showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        showDragHandle: true,
                        context: context, 
                        builder:(context) {
                          return const ShowCardType();
                        },
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(251, 251, 251, 1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Obx(
                                () {
                                  return Text(
                                    selectedCardType.value>=0?cardsType[selectedCardType.value]:'${locale[curLN]?['chooseBank']}',
                                    style: TextStyle(
                                    fontSize: 16,
                                    color: selectedCardType>=0?Colors.black:const Color.fromRGBO(193, 193, 193, 1)
                                  ),);
                                }
                              ),
                            ),
                            const Icon(CupertinoIcons.chevron_down,size: 16,),
                          ],
                        )
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50))
                ),
                onPressed: (){
                  Navigator.pop(context);
                  cards.add([belgisi.text,selectedCardType,cvc.text,eyesi.text]);
                }, 
                child:  Text('${locale[curLN]?['save']}',style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),)
              )
            ],
          ),
        ),
      ),
    );
  }
}