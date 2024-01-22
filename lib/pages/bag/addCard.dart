import 'package:apte/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
List cardList=[
  ['assets/images/turkmenbasyBank.png','Türkmenbaşy Bank','**** **** **** 1234',],
  ['assets/images/dayhanBank.png','Daýhanbank','**** **** **** 1234',],
];
var _selectedCard;
class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Wrap(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text('Bank kartyňyz',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),),
                  Spacer(),
                  IconButton(
                    onPressed: ()=>Navigator.pop(context), 
                    icon: Icon(Icons.close),
                  )
                ],
              ),
              SizedBox(height: 23,),
              Column(
                children: List.generate(cardList.length, (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCard=index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.symmetric(horizontal: 25,vertical: 12),
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: _selectedCard==index?green:Color.fromRGBO(237, 237, 237, 1),
                      )
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          child: Image.asset(cardList[index][0])
                        ),
                        SizedBox(width: 27,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cardList[index][1],style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),),
                              SizedBox(height: 6,),
                              Text(cardList[index][2],style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(131, 131, 131, 1)
                              ),),
                            ],
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: _selectedCard==index?green:Color.fromRGBO(216, 216, 216, 1),
                              width: _selectedCard==index?4:2,
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                ),),
              ),
              Container(
                width: 108,
                height: 18,
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(0))
                  ),
                  onPressed: ()=>Navigator.pushNamed(context, '/kard/newCard',arguments: ['','','','',]), 
                  child: Text('+ Täze kart goş',style: TextStyle(
                    color: orange,
                    fontWeight: FontWeight.w500,
                  ),),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))
                ),
                onPressed: (){
                  Navigator.pop(context);
                }, 
                child: Text('Şu karty ulan',style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),)
              ),
              SizedBox(height: 37,),
            ],
          ),
        ],
      ),
    );
  }
}