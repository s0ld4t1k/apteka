// ignore_for_file: file_names

import 'package:apte/pages/bag/addAdres.dart';
import 'package:apte/pages/bag/addCard.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  child: const Row(
                    children: [
                      Text('+993 ',style: TextStyle(
                        fontSize: 16,
                      ),),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
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
                const SizedBox(height: 140,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}