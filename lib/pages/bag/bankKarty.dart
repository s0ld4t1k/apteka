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
    var jem=ModalRoute.of(context)?.settings.arguments;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5,),
                const Text('Doly adyňyz'),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(251, 251, 251, 1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      hintText: 'Doly adyňyz',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(193, 193, 193, 1),
                        fontSize: 16,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                const Text('Telefon belgiňiz'),
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
                const Text('Salgyňyz'),
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
                    child: const Row(
                      children: [
                        Text('Salgyňyzy saýlaň',style: TextStyle(
                          color: Color.fromRGBO(193, 193, 193, 1),
                          fontSize: 16,
                        ),),
                        Spacer(),
                        Icon(CupertinoIcons.chevron_down,size: 16,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                const Text('Bank kartyňyz'),
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
                    child: const Row(
                      children: [
                        Text('Kart saýlaň',style: TextStyle(
                          color: Color.fromRGBO(193, 193, 193, 1),
                          fontSize: 16,
                        ),),
                        Spacer(),
                        Icon(CupertinoIcons.chevron_down,size: 16,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                const Text('Bellik'),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  height: 139,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(251, 251, 251, 1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1)),
                  ),
                  child: const TextField(
                    textAlignVertical: TextAlignVertical.top,
                    expands: true,
                    maxLines: null,
                    minLines: null,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      hintText: 'Bellik',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(193, 193, 193, 1),
                        fontSize: 16,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 39,),
              ],
            ),
          ),
          Container(
            height: 105,
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
                          const Text('Jemi',style: TextStyle(
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
                        setState(() {
                          curLN='ru';
                        });
                      }, 
                      child: const Text('Sargyt et',style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),)
                    )
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