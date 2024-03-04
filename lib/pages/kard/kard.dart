import 'package:apte/pages/kard/paymentHristroy.dart';
import 'package:apte/pages/main/mainPage.dart';
import 'package:apte/widgets/bag&Card/showCardType.dart';
import 'package:apte/widgets/colors.dart';
import 'package:apte/widgets/langDictionary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
List cardImages=[
  'assets/images/halkBank.png',
  'assets/images/senagatBank.png',
  'assets/images/dayhanBank.png',
  'assets/images/turkmenbasyBank.png',
];
List cards=[
  ['**** **** **** 1234',3,'345','Random name',],
  ['**** **** **** 1234',2,'345','Random name',],
  ['**** **** **** 1234',0,'345','Random name',],
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
        title:  Text('${locale[curLN]?['myCards']}'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              Get.to(()=>const PaymentHistory());
            }, 
            icon: SizedBox(
              width: 23,
              height: 23,
              child: SvgPicture.asset('assets/icons/wallet.svg')
            ),
          ),
          const SizedBox(width: 10,),
        ],
      ),
      body: SingleChildScrollView(
        controller: contrl,
        child: cards.isEmpty?Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Image.asset('assets/images/noCard.png'),
              const SizedBox(height: 18,),
              Text('${locale[curLN]?['noneBankCardText1']}',style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),),
              const SizedBox(height: 17,),
              Text('${locale[curLN]?['noneBankCardText2']}',style: const TextStyle(
                color: Color.fromRGBO(131, 135, 140, 1),
              ),textAlign: TextAlign.center,),
              const SizedBox(height: 33,),
              OutlinedButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(orange.withOpacity(0.1)),
                  minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
                  side: MaterialStateProperty.all(const BorderSide(color: orange)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, '/kard/newCard',arguments: ['','','','',]);
                }, 
                child: Text('${locale[curLN]?['addCard']}',style: const TextStyle(
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
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            itemBuilder:(context, index) {
              return GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/kard/newCard',arguments: cards[index]),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                  width: double.infinity,
                  height: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color.fromRGBO(237, 237, 237, 1))
                  ),
                  child: Row(
                    children: [
                      Image.asset(cardImages[cards[index][1]]),
                      const SizedBox(width: 35,),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cardsType[cards[index][1]],style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16
                                  ),),
                                  const SizedBox(height: 6,),
                                  Text(cards[index][0],style: const TextStyle(
                                    color: Color.fromRGBO(131, 131, 131, 1),
                                    fontSize: 14,
                                  ),)
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right_rounded,size: 20,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }, 
            separatorBuilder:(context, index) => const SizedBox(height: 15,), 
            itemCount: cards.length,
          ),
        ),
      ),
      floatingActionButton: cards.isEmpty?null:FloatingActionButton(
        elevation: 0,
        onPressed: ()=>Navigator.pushNamed(context, '/kard/newCard',arguments: ['','','','',]),
        backgroundColor: orange,
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}