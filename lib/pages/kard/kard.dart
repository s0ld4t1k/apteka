import 'package:apte/widgets/bag&Card/showCardType.dart';
import 'package:apte/widgets/colors.dart';
import 'package:flutter/material.dart';
List cardImages=[
  'assets/images/halkBank.png',
  'assets/images/senagatBank.png',
  'assets/images/dayhanBank.png',
  'assets/images/turkmenbasyBank.png',
];
List cards=[
  ['**** **** **** 1234',3],
  ['**** **** **** 1234',2],
  ['**** **** **** 1234',0],
];
class Kard extends StatefulWidget {
  const Kard({super.key});

  @override
  State<Kard> createState() => _KardState();
}

class _KardState extends State<Kard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Kartlarym'),
      ),
      body: cards.isEmpty?Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Image.asset('assets/images/noCard.png'),
            SizedBox(height: 18,),
            Text('Bank karty tapylmady',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),),
            SizedBox(height: 17,),
            Text('Sargytlary aňsatlyk bilen ýerine ýetirmek üçin bank kartyny goşup bilersiňiz',style: TextStyle(
              color: Color.fromRGBO(131, 135, 140, 1),
            ),textAlign: TextAlign.center,),
            SizedBox(height: 33,),
            OutlinedButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(orange.withOpacity(0.1)),
                minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                side: MaterialStateProperty.all(BorderSide(color: orange)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/kard/newCard');
              }, 
              child: Text('Kart goş',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: orange,
              ),
            ))
          ],
        ),
      ):Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
        child: ListView.separated(
          padding: EdgeInsets.all(0),
          itemBuilder:(context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color.fromRGBO(237, 237, 237, 1))
              ),
              child: Row(
                children: [
                  Image.asset(cardImages[cards[index][1]]),
                  SizedBox(width: 35,),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cardsType[cards[index][1]],style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),),
                              SizedBox(height: 6,),
                              Text(cards[index][0],style: TextStyle(
                                color: Color.fromRGBO(131, 131, 131, 1),
                                fontSize: 12,
                              ),)
                            ],
                          ),
                        ),
                        Icon(Icons.chevron_right_rounded,size: 20,),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }, 
          separatorBuilder:(context, index) => SizedBox(height: 15,), 
          itemCount: cards.length,
        ),
      ),
      floatingActionButton: cards.isEmpty?null:FloatingActionButton(
        elevation: 0,
        onPressed: ()=>Navigator.pushNamed(context, '/kard/newCard'),
        backgroundColor: orange,
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}