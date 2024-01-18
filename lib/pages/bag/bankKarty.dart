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
    var _jem=ModalRoute.of(context)?.settings.arguments;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Text('Doly adyňyz'),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(251, 251, 251, 1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color.fromRGBO(237, 237, 237, 1)),
                  ),
                  child: TextField(
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
                SizedBox(height: 15,),
                Text('Telefon belgiňiz'),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(251, 251, 251, 1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color.fromRGBO(237, 237, 237, 1)),
                  ),
                  child: Row(
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
                SizedBox(height: 15,),
                Text('Salgyňyz'),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      showDragHandle: true,
                      context: context, 
                      builder:(context) {
                      return AddAdres();
                    },);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(251, 251, 251, 1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color.fromRGBO(237, 237, 237, 1)),
                    ),
                    child: Row(
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
                SizedBox(height: 15,),
                Text('Bank kartyňyz'),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      showDragHandle: true,

                      context: context, 
                      builder:(context) {
                      return AddCard();
                    },);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(251, 251, 251, 1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color.fromRGBO(237, 237, 237, 1)),
                    ),
                    child: Row(
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
                SizedBox(height: 15,),
                Text('Bellik'),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  height: 139,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(251, 251, 251, 1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color.fromRGBO(237, 237, 237, 1)),
                  ),
                  child: TextField(
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
                SizedBox(height: 39,),
              ],
            ),
          ),
          Container(
            height: 105,
            padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
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
                          Text('Jemi',style: TextStyle(
                            color: Color.fromRGBO(107, 107, 107, 1),
                          ),),
                          Text('$_jem TMT',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),)
                        ],
                      )
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(196, 46)),
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
                      child: Text('Sargyt et',style: TextStyle(
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