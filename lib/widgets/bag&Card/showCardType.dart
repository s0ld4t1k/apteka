import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
var selectedCardType;
List cardsType=[
  'Halk bank',
  'Senagat bank',
  'Daýhanbank',
  'Türkmenbaşy bank',
];

class ShowCardType extends StatefulWidget {
  const ShowCardType({super.key});

  @override
  State<ShowCardType> createState() => _ShowCardTypeState();
}

class _ShowCardTypeState extends State<ShowCardType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      height: 321,
      child: Column(
        children: [
          Row(
            children: [
              Text('Banklar',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),),
              Spacer(),
              IconButton(
                onPressed: ()=>Navigator.pop(context), 
                icon: Icon(Icons.close_rounded),
              ),
            ],
          ),
          SizedBox(height: 33-18,),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(0),
            itemBuilder:(context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCardType=index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Row(
                    children: [
                      Text(cardsType[index],style: TextStyle(
                        fontSize: 16,
                      ),),
                      Spacer(),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: selectedCardType==index?green:Color.fromRGBO(216, 216, 216, 1),
                            width: selectedCardType==index?4:2,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }, 
            separatorBuilder:(context, index) {
              return Container(
                width: double.infinity,
                height: 1,
                color: Color.fromRGBO(237, 237, 237, 1),
              );
            }, 
            itemCount: cardsType.length,
          )
        ],
      ),
    );
  }
}