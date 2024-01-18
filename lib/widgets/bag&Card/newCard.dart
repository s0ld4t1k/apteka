import 'package:apte/pages/kard/kard.dart';
import 'package:apte/widgets/bag&Card/showCardType.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            padding: EdgeInsets.all(0),
            constraints: BoxConstraints(
              maxHeight: 24,
              maxWidth: 24,
              minHeight: 24,
              minWidth: 24,
            ),
            onPressed: ()=>Navigator.pop(context), 
            icon: Icon(Icons.chevron_left_rounded)
          ),
          title: Text('Kart maglumatlary'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height-231,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Kartyň belgisi'),
                    SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: TextField(
                        controller: belgisi,
                        maxLength: 16,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
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
                    SizedBox(height: 16,),
                    Text('Möhleti'),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(251, 251, 251, 1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color.fromRGBO(237, 237, 237, 1)),
                            ),
                            child: CupertinoPicker(
                              onSelectedItemChanged: (value) {
                                print(value);
                              },
                              itemExtent: 50,
                              selectionOverlay: null,
                              children: List.generate(month.length, (index) => Center(
                                child: Text(month[index],style: TextStyle(
                                  fontSize: 16,
                                ),),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(width: 11,),
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(251, 251, 251, 1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color.fromRGBO(237, 237, 237, 1)),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 20),
                              hintText: 'Ýyl',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(193, 193, 193, 1),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none
                              )
                            ),
                            )
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Text('CVC'),
                    SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: TextField(
                        controller: cvc,
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
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
                    SizedBox(height: 16,),
                    Text('Kartyň eýesi'),
                    SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(251, 251, 251, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color.fromRGBO(237, 237, 237, 1)),
                      ),
                      child: TextField(
                        controller: eyesi,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          counterText: '',
                          hintText: 'Kartyň eýesi',
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
                    SizedBox(height: 16,),
                    Text('Kartyňyz haýsy banka degişli?'),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: ()=>showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        showDragHandle: true,
                        context: context, 
                        builder:(context) {
                          return ShowCardType();
                        },
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(251, 251, 251, 1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color.fromRGBO(237, 237, 237, 1)),
                        ),
                        child: Row(
                          children: [
                            Text(
                              selectedCardType!=null?cardsType[selectedCardType]:'Bank saýla',
                              style: TextStyle(
                              fontSize: 16,
                              color: selectedCardType!=null?Colors.black:Color.fromRGBO(193, 193, 193, 1)
                            ),),
                            Spacer(),
                            Icon(CupertinoIcons.chevron_down,size: 16,),
                          ],
                        )
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(double.infinity, 50))
                ),
                onPressed: (){
                  Navigator.pop(context);
                  cards.add([belgisi.text,selectedCardType,cvc.text,eyesi.text]);
                }, 
                child: Text('Ýatda sakla',style: TextStyle(
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